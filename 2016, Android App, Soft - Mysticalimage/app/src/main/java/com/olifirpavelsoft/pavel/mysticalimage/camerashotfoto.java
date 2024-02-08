package com.olifirpavelsoft.pavel.mysticalimage;

import android.annotation.TargetApi;
import android.app.ActionBar;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.text.format.DateFormat;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndex;
import com.google.android.gms.common.api.GoogleApiClient;
import com.olifirpavelsoft.pavel.mysticalimage.util.SystemUiHider;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

/**
 * cccc
 * An example full-screen activity that shows and hides the system UI (i.e.
 * status bar and navigation/system bar) with user interaction.
 *
 * @see SystemUiHider
 */
public class camerashotfoto extends Activity {
    /**
     * Whether or not the system UI should be auto-hidden after
     * {@link #AUTO_HIDE_DELAY_MILLIS} milliseconds.
     */
    private ImageView imGal;
    private EditText editPassword;
    private EditText editShowText;
    private ProgressBar progressBar;
    public ProgressDialog dialog;
    public Bitmap picnotsecret;
    private ProgressDialog progress;
    private static int TAKE_PICTURE = 1;
    private Uri mOutputFileUri;
    private boolean flag=false;
    private static final boolean AUTO_HIDE = true;
    private final static int SELECT_PHOTO = 12345;
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
    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    private GoogleApiClient client;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_camerashotfoto);


        progressBar = (ProgressBar) findViewById(R.id.progressBar);
        editPassword = (EditText) findViewById(R.id.editpassword);
        editShowText = (EditText) findViewById(R.id.editshowtext);
        imGal = (ImageView) findViewById(R.id.imGal);
        //принимаем данные с главной формы и по ней решаем, что нам надо
        //открыть камеру или галлерею
        byte langER = getIntent().getExtras().getByte("langF");

        if (langER == 1) {
            //Вызов камеры сразу при создании фото
            Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
            File file = new File(Environment.getExternalStorageDirectory().toString(), "test01.jpg"); //<------
            mOutputFileUri = Uri.fromFile(file);
            intent.putExtra(MediaStore.EXTRA_OUTPUT, mOutputFileUri);
            startActivityForResult(intent, TAKE_PICTURE);
            try {
                MediaStore.Images.Media.insertImage(getContentResolver(), file.getAbsolutePath(), file.getName(), file.getName()); // регистрация в фотоальбоме
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        } else {
            //открываем галлерею и выбираем от туда фотографию которую нам надо раскрыть или скрыть в неё инфу.;
            Intent photoPickerIntent = new Intent(Intent.ACTION_PICK);
            photoPickerIntent.setType("image/*");
            startActivityForResult(photoPickerIntent, SELECT_PHOTO);
        }
        final View controlsView = findViewById(R.id.fullscreen_content_controls);
        final View contentView = findViewById(R.id.fullscreen_content);

        // Set up an instance of SystemUiHider to control the system UI for
        // this activity.
        mSystemUiHider = SystemUiHider.getInstance(this, contentView, HIDER_FLAGS);
        mSystemUiHider.setup();
        mSystemUiHider
                .setOnVisibilityChangeListener(new SystemUiHider.OnVisibilityChangeListener() {
                    // Cached values.
                    int mControlsHeight;
                    int mShortAnimTime;

                    @Override
                    @TargetApi(Build.VERSION_CODES.HONEYCOMB_MR2)
                    public void onVisibilityChange(boolean visible) {
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2) {
                            // If the ViewPropertyAnimator API is available
                            // (Honeycomb MR2 and later), use it to animate the
                            // in-layout UI controls at the bottom of the
                            // screen.
                            if (mControlsHeight == 0) {
                                mControlsHeight = controlsView.getHeight();
                            }
                            if (mShortAnimTime == 0) {
                                mShortAnimTime = getResources().getInteger(
                                        android.R.integer.config_shortAnimTime);
                            }
                            controlsView.animate()
                                    .translationY(visible ? 0 : mControlsHeight)
                                    .setDuration(mShortAnimTime);
                        } else {
                            // If the ViewPropertyAnimator APIs aren't
                            // available, simply show or hide the in-layout UI
                            // controls.
                            controlsView.setVisibility(visible ? View.VISIBLE : View.GONE);
                        }


                    }
                });



        // Upon interacting with UI controls, delay any scheduled hide()
        // operations to prevent the jarring behavior of controls going away
        // while interacting with the UI.

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        client = new GoogleApiClient.Builder(this).addApi(AppIndex.API).build();
    }



    /**
     * Set up the {@link ActionBar}, if the API is available.
     */
    @TargetApi(Build.VERSION_CODES.HONEYCOMB)
    private void setupActionBar() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
            // Show the Up button in the action bar.
            getActionBar().setDisplayHomeAsUpEnabled(true);
        }
    }



    /**
     * Touch listener to use for in-layout UI controls to delay hiding the
     * system UI. This is to prevent the jarring behavior of controls going away
     * while interacting with activity UI.
     */


    /**
     * Schedules a call to hide() in [delay] milliseconds, canceling any
     * previously scheduled calls.
     */


    //-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
    //Вызов камеры для создания фото
    @Override

    protected void onActivityResult(int requestCode, int resultCode, Intent data) {

        //--------------------------------------------------------------------------------
        //-*-*-*- Если нужно сфотографировать делаем фоть это -*-*-*-*
        if (requestCode == TAKE_PICTURE) {
            imGal.setImageURI(mOutputFileUri);
            picnotsecret = ((BitmapDrawable) imGal.getDrawable()).getBitmap();
        }
        //-------------------------------------------------------------------------------

        //-*-*-*-* А тут если надо выбрать из галлереи *-*-*-*-*-*-*-*-*-*-*-*-
        if (requestCode == SELECT_PHOTO && resultCode == RESULT_OK && data != null) {
            Uri pickedImage = data.getData();
            String[] filePath = {MediaStore.Images.Media.DATA};
            Cursor cursor = getContentResolver().query(pickedImage, filePath, null, null, null);
            cursor.moveToFirst();
            String imagePath = cursor.getString(cursor.getColumnIndex(filePath[0]));

            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inPreferredConfig = Bitmap.Config.ARGB_8888;
            options.inMutable = true;
            picnotsecret = BitmapFactory.decodeFile(imagePath, options);
            imGal.setImageBitmap(picnotsecret);
            // Do something with the bitmap

            // At the end remember to close the cursor or you will end with the RuntimeException!
            cursor.close();
        }


    }

    //*-*-*-*-*-*-*-*-*-*-*-*-**-*-***-**--*-*-*-*
    //Функция проверки корректности ввода
    public boolean CorrectVvod() {

        //*-*-*-*-* Проверка на корректность ввода данных
        boolean flag = false;
        if (editPassword.getText().toString().equals(""))
            Toast.makeText(this, R.string.Pleasewritepassword, Toast.LENGTH_SHORT).show();
        else
            flag = true;
        return flag;
    }

    public void onClickToSecret(View view) {
//ТУТ раскрытие изображения
        if (CorrectVvod()) {
            int PasswordUser = new Integer((editPassword.getText().toString()));
            String Simvol = "";
            int k = 0;
            boolean flag2 = false;
            int pixelColor = picnotsecret.getPixel(0, 0);
            char ch = (char) Color.alpha(pixelColor);
            //Проверка зашифрованно ли что то в этой картинке
            if (ch == '#') {
                boolean flag = true;
                for (int x = 0; x < picnotsecret.getWidth(); x++) {
                    if (flag) {
                        for (int y = 0; y < picnotsecret.getHeight(); y++) {
                            pixelColor = picnotsecret.getPixel(x, y);
                            ch = (char) Color.alpha(pixelColor);
                            if (ch != '^') {
                                if (ch > 192) ch = (char) (ch + 848);
                                Simvol = Simvol + ch;
                            } else {
                                flag = false;
                                flag2 = true;
                                break;
                            }
                        }
                    } else break;
                }
            } else
                Toast.makeText(this, R.string.Secret_information_not_found, Toast.LENGTH_SHORT).show();
            //Вырезаем пароль
            if (flag2) {
                String Password = "";
                for (int i = 1; i < Simvol.length(); i++) {
                    ch = Simvol.charAt(i);
                    if (ch != '&') {
                        if (ch > 192) ch = (char) (ch + 848);
                        Password = Password + ch;
                    } else {
                        k = i;
                        k++;
                        break;
                    }
                }
                //Проверка пароля
                int pas1 = new Integer(Password);
                if (pas1 == PasswordUser) {
                    String Message = "";
                    for (int i = k; i < Simvol.length(); i++) {
                        Message = Message + Simvol.charAt(i);
                    }
                    editShowText.setText(Message);
                    progressBar.setVisibility(ProgressBar.INVISIBLE);
                } else {
                    Toast.makeText(this, R.string.Password_not_okey, Toast.LENGTH_SHORT).show();
                }
            }
        }

    }

    public void onClickToSaveSecretImage(View view) {
        progress = ProgressDialog.show(camerashotfoto.this, "Mystical Image", "Please wait", true);

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    socritie();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();


    }

private void socritie()
{
    if (CorrectVvod())
    {

        //Тут сокрытие изображжения с дальнейшим сохранением
        char[] PasswordUser = ("#" + editPassword.getText().toString() + "&").toCharArray();
        char[] UserMessage = (editShowText.getText().toString() + "^").toCharArray();
        final char[] CompleteMessageForSecret = new char[PasswordUser.length + UserMessage.length + 1];
        System.arraycopy(PasswordUser, 0, CompleteMessageForSecret, 0, PasswordUser.length);
        System.arraycopy(UserMessage, 0, CompleteMessageForSecret, PasswordUser.length, UserMessage.length);
        int tmp1 = 0;
        final Bitmap dest = Bitmap.createBitmap(picnotsecret.getWidth(), picnotsecret.getHeight(), picnotsecret.getConfig());

        if (!SizeImagetoText(picnotsecret.getWidth(), picnotsecret.getHeight(), PasswordUser.length, UserMessage.length))
            Toast.makeText(this, R.string.Imagebadforsaveyoutext, Toast.LENGTH_SHORT).show();
        else
        {
            for (int x = 0; x < picnotsecret.getWidth(); x++)
            {
                for (int y = 0; y < picnotsecret.getHeight(); y++)
                {
                    int pixelColor = picnotsecret.getPixel(x, y);
                    int pixelAlpha = Color.alpha(pixelColor);
                    int pixelRed = Color.red(pixelColor);
                    int pixelGreen = Color.green(pixelColor);
                    int pixelBlue = Color.blue(pixelColor);
                    if (tmp1 < CompleteMessageForSecret.length)
                    {
                        if (CompleteMessageForSecret[tmp1] > 192)
                            pixelAlpha = RustoSimvol(CompleteMessageForSecret[tmp1]);
                        else
                            pixelAlpha = CompleteMessageForSecret[tmp1];
                        tmp1++;
                    }
                    int newPixel = Color.argb(pixelAlpha, pixelRed, pixelGreen, pixelBlue);
                    dest.setPixel(x, y, newPixel);
                }
            }
            SavePicture(dest);

            progress.dismiss();

        }

    }


}

    private boolean SizeImagetoText(int Width, int Height,int Password, int Message)
    {
        boolean tmp=false;
        if (((Width * Height)/16)>(Password*Message*16)) tmp=true;
        return tmp;
    }

private int RustoSimvol(char simvol)
{
    int tmp = simvol-848;
    return tmp;
}
    public File getAlbumStorageDir(String albumName) {
        // Get the directory for the user's public pictures directory.
        File file = new File(Environment.getExternalStoragePublicDirectory(
                Environment.DIRECTORY_PICTURES), albumName);
        if (!file.mkdirs()) {

        }
        return file;
    }
    private String SavePicture(Bitmap bitmap) {
        String date = (DateFormat.format("ddMMyyyy hhmmss", new java.util.Date()).toString());
        File file = new File(getAlbumStorageDir("Mystical Image"),"MysticalImage" + date+".jpg"); // создать уникальное имя для файла основываясь на дате сохранения
        try {
           FileOutputStream fOut = new FileOutputStream(file);
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, fOut);
            fOut.flush();
            fOut.close();
            MakeSureFileWasCreatedThenMakeAvabile(file);
             // регистрация в фотоальбоме
        } catch (Exception e) // здесь необходим блок отслеживания реальных ошибок и исключений, общий Exception приведен в качестве примера
        {
            return e.getMessage();
        }
        return "";
    }
    private void MakeSureFileWasCreatedThenMakeAvabile(File file) {
        MediaScannerConnection.scanFile(this,
                new String[] { file.toString() }, null,
                new MediaScannerConnection.OnScanCompletedListener() {
                    public void onScanCompleted(String path, Uri uri) {
                        Log.e("ExternalStorage", "Scanned " + path + ":");
                        Log.e("ExternalStorage", "-> uri=" + uri);

                    }
                });

    }





    //-----------------
    @Override
    public void onStart() {
        super.onStart();

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        client.connect();
        Action viewAction = Action.newAction(
                Action.TYPE_VIEW, // TODO: choose an action type.
                "camerashotfoto Page", // TODO: Define a title for the content shown.
                // TODO: If you have web page content that matches this app activity's content,
                // make sure this auto-generated web page URL is correct.
                // Otherwise, set the URL to null.
                Uri.parse("http://host/path"),
                // TODO: Make sure this auto-generated app URL is correct.
                Uri.parse("android-app://com.olifirpavelsoft.pavel.mysticalimage/http/host/path")
        );
        AppIndex.AppIndexApi.start(client, viewAction);
    }

    @Override
    public void onStop() {
        super.onStop();

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        Action viewAction = Action.newAction(
                Action.TYPE_VIEW, // TODO: choose an action type.
                "camerashotfoto Page", // TODO: Define a title for the content shown.
                // TODO: If you have web page content that matches this app activity's content,
                // make sure this auto-generated web page URL is correct.
                // Otherwise, set the URL to null.
                Uri.parse("http://host/path"),
                // TODO: Make sure this auto-generated app URL is correct.
                Uri.parse("android-app://com.olifirpavelsoft.pavel.mysticalimage/http/host/path")
        );
        AppIndex.AppIndexApi.end(client, viewAction);
        client.disconnect();
    }
}
