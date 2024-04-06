package com.example.dai_tub;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private static final int SPLASH_TIMEOUT = 2000; // Tempo de espera em milissegundos (2 segundos)

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.splash_screen); // Exibe a tela de entrada

        // Aguarda por SPLASH_TIMEOUT antes de abrir a MainActivity
        new Handler().postDelayed(() -> {
            Intent registroIntent = new Intent(MainActivity.this, RegistroActivity.class);
            startActivity(registroIntent);
            finish(); // Fecha a tela de entrada após abrir a MainActivity
        }, SPLASH_TIMEOUT);
    }
}
