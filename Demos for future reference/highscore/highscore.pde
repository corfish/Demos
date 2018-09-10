import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.content.Context;
import android.app.Activity;
int highscore; 


void saveData() {
  SharedPreferences sharedPreferences;
  SharedPreferences.Editor editor;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext()); 
  editor = sharedPreferences.edit();
  editor.putInt("Highscore", highscore);
  editor.commit();
}
void loadData() {
  SharedPreferences sharedPreferences;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext()); 
  highscore = sharedPreferences.getInt("Highscore", highscore);
}