package com.example.kypcoboy_prodjeck;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity6 extends AppCompatActivity {

    private Button loginButton;
    private Button createAccountButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Проверка наличия входа пользователя
        if (isUserLoggedIn()) {
            // Если пользователь уже вошел, открываем MainActivity11
            Intent intent = new Intent(MainActivity6.this, MainActivity11.class);
            startActivity(intent);
            finish(); // Закрываем текущую активность, чтобы пользователь не мог вернуться к ней
        } else {
            // Иначе открываем активность MainActivity6
            setContentView(R.layout.activity_main6);

            loginButton = findViewById(R.id.Sign_UP);
            loginButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // Start MainActivity7
                    Intent intent = new Intent(MainActivity6.this, MainActivity7.class);
                    startActivity(intent);
                }
            });

            createAccountButton = findViewById(R.id.createAccountButton);
            createAccountButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // Start MainActivity8
                    Intent intent = new Intent(MainActivity6.this, MainActivity8.class);
                    startActivity(intent);
                }
            });
        }
    }

    // Метод для проверки входа пользователя
    private boolean isUserLoggedIn() {
        // Ваш код для проверки, например, используя SharedPreferences
        SharedPreferences preferences = getSharedPreferences("login", MODE_PRIVATE);
        return preferences.getBoolean("rememberMe", false);
    }
}