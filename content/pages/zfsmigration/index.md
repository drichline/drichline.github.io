---
title: "In-place migration to /home on ZFS: dangerous but ultimately beautiful "
date: "2026-08-15"
---

## Background

After setting up a syncoid backup on my main zpool, I realized rsyncing my desktop to a zpool is janky and horrible. Instead of reinstalling Void with zfsbootmenu, I decided to do it in-place; /home already has backups, so worst consequence is I reinstall anyway. 

File-level backups give me the heebie-jeebies. Several years ago I trusted Deja-Dup/Duplicity, and it couldn't handle the sheer size of my backup when I needed a full restore. rsync is leagues better but still an extremely slow, potentially imperfect copy that can fail. 

## Here's what I did:

---

* Original state: 80 GiB `/` and 300 GiB `/home` on a single 1 TB ext4 partition

* Boot into hrmpf and install ZFS to the livecd environment

* Shrink the ext4; `e2fsck`; create a full-size partition for a single-vdev pool with `-o mountpoint=none` and a `/home` dataset with `-o mountpoint=/home`

* Mount the `/` partition to e.g. `/mnt/root`

* `rsync -aHAXP --numeric-ids /mnt/root/home/ /home/` 


* (ideally verify transfer);  `rm -rf /mnt/root/home`

*  `umount /mnt/root`

* Shrink the ext4 to file size + buffer; 150 GiB in my case; `e2fsck`

* Make a third partition; `zpool add`

* Create child datasets with `syncoid:no-sync=true` for cache/junk files

* Chroot into `/mnt/root` to ensure ZFS is installed (don't have 30 old kernels like me or it'll take hours!), and to add `zpool import -a` and `zfs mount -a` to `rc.local` or whatever systemd uses. 

* Set and verify UID/perms on all the mountpoints

---

## Results

It was quite a slow and dangerous operation, and there was one instance of metadata corruption after the second shrink, which `e2fsck` fixed. Also nearly fat-fingered the new partition overtop the others. However, it worked out in the end. Striping across the two vdevs should be safe because they're partitions on the same NVMe anyways. If I did reinstall, the transfer still would've taken at least 12 hours because AT&T Fiber LAN is limited to 10/100. 

---

## Killer App: syncoid

If you haven't tried syncoid (which comes with sanoid), you should. It's a fancy script wrapper around `zfs send | zfs receive`. By default, it replicates a dataset (+ child datasets with -r) to a dataset on another pool along with snapshots; by default it creates a temporary snapshot to synchronize and resume interrupted transfers. 

The big advantage is that I can create exact copies of my pools without any configuration, and use the same command in reverse to restore the pool if necessary. It does *NOT* copy pool attributes because that would interfere with the target dataset's needed attributes. 

In my case, my workstation can now run 

`syncoid pool/home glados:slab/home-backup` 

In turn, GLaDOS has an @hourly crontab to run

`syncoid -r slab backup/slab`

When you need to recover a pool/dataset, simply `zfs destroy pool/home` if necessary and run syncoid in reverse

`syncoid glados:slab/home-backup pool/home`