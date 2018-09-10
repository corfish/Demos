import android.app.Activity;
import android.content.res.AssetFileDescriptor;
import android.content.Context;
import android.media.MediaPlayer;
import android.media.SoundPool;
import android.media.AudioManager;
 
/////////////////////////////////////////////////////////
 
SoundPool soundPool;
HashMap<Object, Object> soundPoolMap;
Activity act;
Context cont;
AssetFileDescriptor afd1, afd2;
int s1, s2;
int streamId;
 
 
void playSound(int soundID)
{
  // play(int soundID, float leftVolume, float rightVolume, int priority, int loop, float rate)
 
  soundPool.stop(streamId); // kill previous sound - quick hack to void mousePressed triggering twice
  streamId = soundPool.play(soundID, 1.0, 1.0, 1, 0, 1f);
}
 
void setup() {
  fullScreen();
  act = this.getActivity();
  cont = act.getApplicationContext();
 
  // load up the files
  try {
    afd1 = cont.getAssets().openFd("test.mp3");
    afd2 = cont.getAssets().openFd("Explosion Of Ship.mp3");
  } 
  catch(IOException e) {
    println("error loading files:" + e);
  }
 
  // create the soundPool HashMap - apparently this constructor is now depracated?
  soundPool = new SoundPool(12, AudioManager.STREAM_MUSIC, 0);
  soundPoolMap = new HashMap<Object, Object>(2);
  soundPoolMap.put(s1, soundPool.load(afd1, 1));
  soundPoolMap.put(s2, soundPool.load(afd2, 1));
};
 
void draw() {
 
  fill(#B4BDE8);
  rect(0, 0, width, height/2);
  fill(#E8B4E5);
  rect(00, (height/2), width, height/2);
 
 
  if (mousePressed) {
 
    if (mouseY < height/2) {
      playSound(1);
    } else {
      playSound(2);
    }
 
  }
};