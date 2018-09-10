/*
* Sound pool is more optimized and for 5 sec music while media player is for background music
*/
import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.content.Context;
import android.app.Activity;
import android.media.SoundPool;
import android.media.AudioManager;

MediaPlayer mp;
Context context; 
Activity act;
AssetFileDescriptor afd;

SoundPool soundPool;
HashMap<Object, Object> soundPoolMap;
AssetFileDescriptor afd1;
int s1, s2;
int streamId;

void setup() {
  
  //set up essential part for music playing
  act = this.getActivity();
  context = act.getApplicationContext();
  
  //set up media player
  try {
    mp = new MediaPlayer();
    afd = context.getAssets().openFd("test.mp3");//which is in the data folder
    println("Successfully loaded audio file");
   mp.setDataSource(afd.getFileDescriptor(), afd.getStartOffset(), afd.getLength());
    mp.prepare();
  } 
  catch(IOException e) {
    println("file did not load");
  }
  mp.setVolume(1.0,1.0);
  mp.start();
  
  // set up soundPool
  try {
    afd1 = context.getAssets().openFd("test3.mp3");
  
  } 
  catch(IOException e) {
    println("error loading files:" + e);
  }
  
  // create the soundPool HashMap - apparently this constructor is now depracated?
  soundPool = new SoundPool(12, AudioManager.STREAM_MUSIC, 0);
  soundPoolMap = new HashMap<Object, Object>(2);
  soundPoolMap.put(s1, soundPool.load(afd1, 1));
  
};

void draw() {
  
  fill(#B4BDE8);
  rect(0, 0, width, height/2);
  fill(#E8B4E5);
  rect(00, (height/2), width, height/2);
 
 
  if (mousePressed) {

      playSound(1);
  
  }
  
}

public void pause() {
  super.pause();
  if (mp !=null) {
    mp.release();
    mp = null;
  }
};

public void stop() {
  super.stop();
  if (mp !=null) {
    mp.release();
    mp = null;
  }
};
void playSound(int soundID)
{
  // play(int soundID, float leftVolume, float rightVolume, int priority, int loop, float rate)
 
  soundPool.stop(streamId); // kill previous sound - quick hack to void mousePressed triggering twice
  streamId = soundPool.play(soundID, 1.0, 1.0, 1, 0, 1f);
}