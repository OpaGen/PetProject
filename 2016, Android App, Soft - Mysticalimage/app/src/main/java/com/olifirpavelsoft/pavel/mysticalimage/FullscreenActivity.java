package com.olifirpavelsoft.pavel.mysticalimage;

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.view.View;
import android.view.WindowManager;
import android.widget.Toast;

import com.olifirpavelsoft.pavel.mysticalimage.util.SystemUiHider;

/**
 * An example full-screen activity that shows and hides the system UI (i.e.
 * status bar and navigation/system bar) with user interaction.
 *
 * @see SystemUiHider
 */

public class FullscreenActivity extends Activity {
    /**
     * Whether or not the system UI should be auto-hidden after
     * {@link #AUTO_HIDE_DELAY_MILLIS} milliseconds.
     */
    private static final boolean AUTO_HIDE = true;

    /**
     * If {@link #AUTO_HIDE} is set, the number of milliseconds to wait after
     * user interaction before hiding the system UI.
     */
    private static final int AUTO_HIDE_DELAY_MILLIS = 3000;

    /**
     * If set, will toggle the system UI visibility upon interaction. Otherwise,
     * will show the system UI visibility upon interaction.
     */
    private static final boolean TOGGLE_ON_CLICK = true;

    /**
     * The flags to pass to {@link SystemUiHider#getInstance}.
     */
    private static final int HIDER_FLAGS = SystemUiHider.FLAG_HIDE_NAVIGATION;


    /**
     * The instance of the {@link SystemUiHider} for this activity.
     */
    private SystemUiHider mSystemUiHider;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_fullscreen);
        //Запрос разрешений для Android 6.0 и выше
        requestMultiplePermissions();
    }

    public void onClickCameraShot(View view) {
        //Открытие нового окна
        Intent intent = new Intent(FullscreenActivity.this, camerashotfoto.class);
        byte lang=1;
        intent.putExtra("langF", lang); //передаю значение 1 если надо сфоткать и 2 если выбрать из галлереи
        startActivity(intent);
    }
    public void onClickAboutProgramm (View view)
    {
        //О программе
        Toast.makeText(this, R.string.AboutAvtor, Toast.LENGTH_SHORT).show();
    }
    public void onClickstarprogram (View view)
    {
        //Открытие окна с приложением в Google Play
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse("market://details?id=com.olifirpavelsoft.pavel.mysticalimage"));
        startActivity(intent);
    }
    //Функция запроса разрешений для Android 6.0
    public void requestMultiplePermissions() {
        int PERMISSION_REQUEST_CODE=0;
        ActivityCompat.requestPermissions(this,
                new String[] {
                        Manifest.permission.WRITE_EXTERNAL_STORAGE,
                        Manifest.permission.READ_EXTERNAL_STORAGE,
                        Manifest.permission.CAMERA,
                        Manifest.permission.MEDIA_CONTENT_CONTROL
                },
                PERMISSION_REQUEST_CODE);
    }

    public void onClickGalleryOpen(View view) {

        //Открытие нового окна
        Intent intent = new Intent(FullscreenActivity.this, camerashotfoto.class);
        byte lang=2;
        intent.putExtra("langF",lang); //передаю значение 1 если надо сфоткать и 2 если выбрать из галлереи
        startActivity(intent);
    }
}

