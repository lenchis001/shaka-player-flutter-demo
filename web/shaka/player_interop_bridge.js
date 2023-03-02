async function jsInitPlayer(manifestUrl) {
  // Create a Player instance.
  const video = document.getElementById('video-element');
  const player = new shaka.Player(video);

  window.player = player;

  try {
    await player.load(manifestUrl);
    video.play();
  } catch (e) {
    // onError is executed if the asynchronous load fails.
    console.log('An error occurred!!!', e);
  }
}

async function closePlayer() {

}