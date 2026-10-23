---
title: ""
# date: "2026-10-23"
# lastmod: "2026-10-23"
math: false
toc: false
---


<!-- Player modified from Loveberry: https://loveberry.nekoweb.org/resources/snippets -->
<title>Radio</title>

<style>
#musicplayer .title-color img {
    height: 14px;
    width: 14px;
}

:root {
        --titlebar-gradient: linear-gradient(90deg, #000, #fff);
        --dialog-blue: #4e4e4e;
        --dialog-accent: white; /* color of text on diaglog blue */
        --titlebar-color: white; /* reccomended to change so its easy to read on titlebar color */
        /* --player-image: url(https://loveberry.nekoweb.org/assets/images/mp/yuzuha.png); */
        --player-image: "";

    /*** 98 css styling ***/
    /* while some of these may specify a single element, theyre used across mulitple */
        --surface: #c0c0c0;
        --button-highlight: #ffffff;
        --button-face: #dfdfdf;
        --button-shadow: #808080;
        --light-button-shadow: #a9a9a9;
        --window-frame: #0a0a0a;
        --border-field: inset -1px -1px var(--button-highlight),
            inset 1px 1px var(--button-shadow), inset -2px -2px var(--button-face),
            inset 2px 2px var(--window-frame);
    }

    @font-face {
  font-family: "Pixelated MS Sans Serif";
  src: url("qgjjre.woff") format("woff");
  src: url("8fwbkl.woff2") format("woff2");
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: "Pixelated MS Sans Serif";
    src: url("z7csle.woff") format("woff");
    src: url("moqhx6.woff2") format("woff2");
    font-weight: bold;
    font-style: normal;
    }

    #musicplayer {
  font-family: "Pixelated MS Sans Serif", Arial;
  -webkit-font-smoothing: none;
  font-size: 11px;
  color:var(--window-frame);
  width: fit-content;
  border:var(--window-frame) solid 1px;
  margin:0 auto;
    box-shadow: inset -1px -1px var(--window-frame), inset 1px 1px var(--button-face), inset -2px -2px var(--button-shadow), inset 2px 2px var(--button-highlight);
  background: var(--surface);
  padding: 3px;
  width: 260px;
    }

    .title-color {  
  padding: 3px 2px 3px 3px;
  display: flex;
  justify-content: space-between;
  align-items: center;
    background: var(--titlebar-gradient);
    margin-bottom: 2px;
    font-weight: bold;
}

.actual-title {
    color:var(--titlebar-color);
  display: flex;
  gap: 5px;
}

.seeking {
    font-weight: normal;
    font-size: 11px;
  display: flex;
  justify-content: center;
  align-items: center;
    gap: 5px;
    margin: 12px 0;
}

.player-flex {
    display: flex;
    gap: 3px;
}

.player-main {
    width: calc(100% - 100px);
    margin-top: 1px;
}

.player-icon-holder {
  border: 2px solid var(--surface);
  width:95px;
  height:95px;
  padding: 1px;
  background-image:linear-gradient(-45deg, var(--button-face) 50%, var(--window-frame) 50%);
  background-size:cover;
  background-repeat:no-repeat;
  border-width:1px;
  border-style:solid;
  border-color: var(--button-shadow) var(--button-highlight) var(--button-highlight) var(--button-shadow);
  
  overflow: hidden;
  position:relative;
  z-index: 2;
}

.player-icon {
    background-image:var(--player-image);
    background-size: contain;
    background-repeat: no-repeat;
  width:95px;
  height:95px;
  display: display;
}

/* BELOW IS LARGELY RIPPED FROM 98 CSS */
.track-select {
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  border: none;
  border-radius:0;
  box-sizing: border-box;
  outline:0;
  
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;

  position: relative;
  padding: 3px 4px;
  padding-right: 32px;
  background-image: url("button-down.svg");
  background-position: top 2px right 2px;
  background-repeat: no-repeat;
  width:100%;

  box-shadow: var(--border-field);
  background-color: var(--button-highlight);
  height: 21px;

  font-family: "Pixelated MS Sans Serif", Arial;
  -webkit-font-smoothing: none;
  font-size: 11px;
  font-weight: lighter;
}

.track-select:focus {
  color: var(--dialog-accent);
  background-color: var(--dialog-blue);

}
.track-select:focus option {
  color: var(--window-frame);
  background-color: var(--button-highlight);  
  outline: 1px;
  border: none;
}

.track-select:active {
  background-image: url("button-down-active.svg");
}

/* input */
#musicplayer input[type="range"] {  
  appearance: none;
  -webkit-appearance: none;
  width: 100%;
  background: transparent;
}

#musicplayer input[type="range"]:focus {
  outline: none;
}

#musicplayer input[type="range"]::-webkit-slider-thumb {
  appearance: none;
  -webkit-appearance: none;
  height: 21px;
  width: 11px;
  background: url("indicator-horizontal.svg");
  transform: translateY(-8px);
  box-shadow: none;
  border: none;
}

#musicplayer input[type="range"].has-box-indicator::-webkit-slider-thumb {
  background: url("indicator-rectangle-horizontal.svg");
  transform: translateY(-10px);
}

#musicplayer input[type="range"]::-moz-range-thumb {
  height: 21px;
  width: 11px;
  border: 0;
  border-radius: 0;
  background: url("indicator-horizontal.svg");
  transform: translateY(2px);
}

#musicplayer input[type="range"].has-box-indicator::-moz-range-thumb {
  background: url("indicator-rectangle-horizontal.svg");
  transform: translateY(0px);
}

#musicplayer input[type="range"]::-webkit-slider-runnable-track {
  width: 100%;
  height: 2px;
  box-sizing: border-box;
  background: var(--window-frame);
  border-right: 1px solid var(--button-shadow);
  border-bottom: 1px solid var(--button-shadow);
  box-shadow: 1px 0 0 var(--button-highlight), 1px 1px 0 var(--button-highlight), 0 1px 0 var(--button-highlight), -1px 0 0 var(--light-button-shadow),
    -1px -1px 0 var(--light-button-shadow), 0 -1px 0 var(--light-button-shadow), -1px 1px 0 var(--button-highlight), 1px -1px var(--light-button-shadow);
}

#musicplayer input[type="range"]::-moz-range-track {
    width: 100%;
    height: 2px;
    box-sizing: border-box;
    background: var(--window-frame);
    border-right: 1px solid var(--button-shadow);
    border-bottom: 1px solid var(--button-shadow);
    box-shadow: 1px 0 0 var(--button-highlight), 1px 1px 0 var(--button-highlight), 0 1px 0 var(--button-highlight), -1px 0 0 var(--light-button-shadow),
    -1px -1px 0 var(--light-button-shadow), 0 -1px 0 var(--light-button-shadow), -1px 1px 0 var(--button-highlight), 1px -1px var(--light-button-shadow);
}

.window-button {
    background: var(--surface);
    border: none;
    border-radius: 0;
    box-shadow: inset -1px -1px var(--window-frame),inset 1px 1px var(--button-highlight),inset -2px -2px var(--button-shadow),inset 2px 2px var(--button-face);
    box-sizing: border-box;
    color: inherit;
    text-shadow: 0 0 var(--window-frame);
}

.window-button:active {
  box-shadow: inset -1px -1px var(--button-highlight), inset 1px 1px var(--window-frame), inset -2px -2px var(--button-face), inset 2px 2px var(--button-shadow);
  text-shadow: 1px 1px var(--window-frame);
}

.window-button:focus  {
  outline: 1px dotted #000;
  outline-offset: -4px;
}
.player-buttons {
    display: flex;
    gap: 10px;
    margin: 5px 5px 0 5px;
}
.player-buttons .window-button  {
    width: 33%;
    font-size: 10px;
    padding: 5px 10px;
}
.player-buttons .window-button svg {
   width: 15px;
   height: 15px;
}

.title-bar-controls {
    display: flex;
}
.close {
    margin-left: 2px;
    background-image: url("close.svg");
    background-repeat: no-repeat;
    background-position: top 3px left 4px;

    padding: 0;
    display: block;
    min-width: 16px;
    min-height: 14px;
}

.minimize {
  background-image: url("minimize.svg");
  background-repeat: no-repeat;
  background-position: bottom 3px left 4px;
    padding: 0;
    display: block;
    min-width: 16px;
    min-height: 14px;
}

.maximize {
  background-image: url("maximize.svg");
  background-repeat: no-repeat;
  background-position: top 2px left 3px;
    padding: 0;
    display: block;
    min-width: 16px;
    min-height: 14px;
}

</style>

<div id="musicplayer">   
        <div class="title-color">
            <div class="actual-title">
            <img src="player-icon.png" alt=""> Radio Tuner
            </div>
            <div class="title-bar-controls">
                <div class="window-button minimize"></div>
                <div class="window-button maximize"></div>
                <div class="window-button close"></div>
            </div>
        </div>
        <div class="player-flex">
            <div class="player-icon-holder">
            <div class="player-icon"></div>
            </div>
            <div class="player-main">
        <select class="track-select"></select>
        <!-- <div>
            <div id="track">
                <span>Hello world</span>
            </div>
        </div> -->
      <div class="controls">
          <div class="seeking">
              <div class="current-time">00:00</div>
              <input type="range" min="1" max="100" value="0" class="seek_slider" onchange="seekTo()">
              <div class="total-duration">∞</div>
          </div>
          <div class="player-buttons">
              <button class="window-button prev-track" onclick="prevTrack()">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-skip-back-icon lucide-skip-back"><path d="M17.971 4.285A2 2 0 0 1 21 6v12a2 2 0 0 1-3.029 1.715l-9.997-5.998a2 2 0 0 1-.003-3.432z"/><path d="M3 20V4"/></svg>
              </button>
              <button class="window-button playpause-track" onclick="playpauseTrack()">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-play-icon lucide-play"><path d="M5 5a2 2 0 0 1 3.008-1.728l11.997 6.998a2 2 0 0 1 .003 3.458l-12 7A2 2 0 0 1 5 19z"/></svg>
              </button>
              <button class="window-button next-track" onclick="nextTrack()">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-skip-forward-icon lucide-skip-forward"><path d="M21 4v16"/><path d="M6.029 4.285A2 2 0 0 0 3 6v12a2 2 0 0 0 3.029 1.715l9.997-5.998a2 2 0 0 0 .003-3.432z"/></svg>
              </button>
          </div>
      </div>
            </div>
        </div>
      <audio id="music" src=""></audio>
  </div>


<script>
// DEFINE YOUR SONGS HERE
let track_list = [
      {
          name:"Lofi Girl",
          artist:"Various",
          path:`https://radio.perilune.space/lofi_girl.mp3?t=${Date.now()}`,
          image:"lofigirl.jpg"
      },
      {
          name:"Los Santos Rock Radio",
          artist:"Various",
          path:`https://radio.perilune.space/lsrr.mp3?t=${Date.now()}`,
          image:"lsrr.png"
      },
    //   {
    //       name:"Los Santos Rock Radio (No Ads)",
    //       artist:"Various",
    //       path:`https://radio.perilune.space/lsrr_noads.mp3?t=${Date.now()}`,
    //       image:"lsrr.png"
    //   },
      {
          name:"Wii Music",
          artist:"Nintendo",
          path:`https://radio.perilune.space/wii.mp3?t=${Date.now()}`,
          image:"wii.png"
      },
  ];
  
// THATS ALL TY :3

let now_playing = document.querySelector(".now-playing");
let track_select = document.querySelector(".track-select");
let playpause_btn = document.querySelector(".playpause-track");
let seek_slider = document.querySelector(".seek_slider");
let curr_time = document.querySelector(".current-time");
let total_duration = document.querySelector(".total-duration");

let track_index = 0;
let isPlaying = false;
let updateTimer;

let curr_track = document.getElementById("music");

function populateDropdown() {
  if (!track_select) return;
  track_select.innerHTML = "";
  track_list.forEach((track, index) => {
    const option = document.createElement("option");
    option.value = index;
    option.textContent = `${track.name} — ${track.artist}`;
    track_select.appendChild(option);
  });
  track_select.value = track_index;
}

function loadTrack(track_index) {
  document.documentElement.style.cssText = `--player-image: url(${track_list[track_index].image})`;
  clearInterval(updateTimer);
  resetValues();

  curr_track.src = track_list[track_index].path;
  curr_track.load();

  if (now_playing) now_playing.textContent = (track_index + 1) + " / " + track_list.length;

  updateTimer = setInterval(seekUpdate, 1000);
  curr_track.addEventListener("ended", nextTrack);

  if (track_select) track_select.value = track_index;
}

function resetValues() {
  curr_time.textContent = "0:00";
  total_duration.textContent = "0:00";
  seek_slider.value = 0;
}

if (track_select) {
  track_select.addEventListener("change", function() {
    track_index = parseInt(this.value);
    loadTrack(track_index);
    playTrack();
  });
}

function playpauseTrack() {
  if (!isPlaying) playTrack();
  else pauseTrack();
}

function playTrack() {
  curr_track.play();
  isPlaying = true;
  playpause_btn.innerHTML = `
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
    viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2"
    stroke-linecap="round" stroke-linejoin="round"
    class="lucide lucide-pause-icon"><rect x="14" y="3" width="5" height="18" rx="1"/><rect x="5" y="3" width="5" height="18" rx="1"/></svg>`;
}

function pauseTrack() {
  curr_track.pause();
  isPlaying = false;
  playpause_btn.innerHTML = `
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
    viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2"
    stroke-linecap="round" stroke-linejoin="round"
    class="lucide lucide-play-icon"><path d="M5 5a2 2 0 0 1 3.008-1.728l11.997 6.998a2 2 0 0 1 .003
    3.458l-12 7A2 2 0 0 1 5 19z"/></svg>`;
}

function nextTrack() {
  if (track_index < track_list.length - 1) track_index += 1;
  else track_index = 0;
  loadTrack(track_index);
  playTrack();
}

function prevTrack() {
  if (track_index > 0) track_index -= 1;
  else track_index = track_list.length - 1;
  loadTrack(track_index);
  playTrack();
}

function seekTo() {
  let absEnd = curr_track.buffered.end(curr_track.buffered.length - 1);
//   seekto = curr_track.duration * (seek_slider.value / 100);
  seekto = absEnd * (seek_slider.value / 100);
  curr_track.currentTime = seekto;
}

function seekUpdate() {
  let seekPosition = 0;
  let absEnd = curr_track.buffered.end(curr_track.buffered.length - 1);
  if (!isNaN(curr_track.duration)) {
    // seekPosition = curr_track.currentTime * (100 / curr_track.duration);
    seekPosition = curr_track.currentTime * (100 / absEnd);
    seek_slider.value = seekPosition;

    let currentMinutes = Math.floor(curr_track.currentTime / 60);
    let currentSeconds = Math.floor(curr_track.currentTime - currentMinutes * 60);
    let durationMinutes = Math.floor(curr_track.duration / 60);
    let durationSeconds = Math.floor(curr_track.duration - durationMinutes * 60);
    let endMinutes = Math.floor(curr_track.buffered.end(curr_track.buffered.length - 1) / 60);
    let endSeconds = Math.floor(curr_track.buffered.end(curr_track.buffered.length - 1) - endMinutes * 60);

    if (currentSeconds < 10) currentSeconds = "0" + currentSeconds;
    if (durationSeconds < 10) durationSeconds = "0" + durationSeconds;

    curr_time.textContent = currentMinutes + ":" + currentSeconds;
    // total_duration.textContent = durationMinutes + ":" + durationSeconds;
    total_duration.textContent = endMinutes + ":" + String(endSeconds).padStart(2, '0');
  }
}

populateDropdown();
loadTrack(track_index);
</script>