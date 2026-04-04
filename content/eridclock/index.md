---
title: "Eridian Clock"
date: "2026-04-04"
---

<style>
    p, h1, h2, h3 {text-align: center;}
    .big {font-size: 6rem;}
</style>


</head>

<h1 class="big"><div id="time"></div></h1>
<h3 ><span id="date-display"></span></h3>

---

# Epoch: Book release

<h1 class="big"><div id="epoch"></div></h1>
<h1><div id="date"></div></h1>

<script>
const eridTick = 2.366;
const eridDay = Math.pow(6, 5) * eridTick;
const eridYear = 198.8 * eridDay;
const epoch = new Date(2021, 5, 4);

function base6(num) {
    const symbols = ['ℓ', 'Ɪ', 'V', 'λ', '+', '∀'];
    if (num === 0) return symbols[0];

    let digits = [];
    while (num > 0) {
        digits.push(symbols[num % 6]);
        num = Math.floor(num / 6);
    }
    return digits.reverse().join('');
}

function updateClock() {

    const now = Date.now();

    const seconds = ((now - epoch) / 1000) % eridDay;

    const year = (now - epoch) / 1000 / eridYear;

    const eridTime = base6(Math.round(seconds / eridTick));

    const eridEpoch = base6(
        Math.round(
            Math.round((now - epoch.getTime()) / 1000) / eridTick
        )
    );

    const eridDate =
        "Year " + Math.round(year) +
        " day " + Math.round((year - Math.floor(year)) * 198.8);

    document.getElementById("time").textContent = eridTime;
    document.getElementById("epoch").textContent = eridEpoch;
    document.getElementById("date").textContent = eridDate;

const now2 = new Date();
const dateString = now2.toUTCString();

// 2. Find the element by its ID
const displayElement = document.getElementById('date-display');

// 3. Set the text
displayElement.textContent = dateString;
}

// update 10 times per second
setInterval(updateClock, 100);
updateClock();
</script>
