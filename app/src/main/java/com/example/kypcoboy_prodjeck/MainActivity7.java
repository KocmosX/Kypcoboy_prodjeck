package com.example.kypcoboy_prodjeck;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;

public class MainActivity7 extends AppCompatActivity {

    private EditText loginEditText, passwordEditText;
    private Button loginButton;
    private TextView signUpTextView, forgetPasswordTextView;
    private CheckBox rememberMeCheckBox;

    private FirebaseAuth mAuth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main7);

        mAuth = FirebaseAuth.getInstance();

        loginEditText = findViewById(R.id.loginEditText);
        passwordEditText = findViewById(R.id.passwordEditText);
        loginButton = findViewById(R.id.Sign_UP);
        signUpTextView = findViewById(R.id.termsTextView1);
        forgetPasswordTextView = findViewById(R.id.forgetPasswordTextView);
        rememberMeCheckBox = findViewById(R.id.rememberMeCheckBox);

        // Проверить состояние запоминания пользователя
        SharedPreferences sharedPreferences = getSharedPreferences("login", MODE_PRIVATE);
        boolean rememberMe = sharedPreferences.getBoolean("rememberMe", false);

        if (rememberMe) {
            FirebaseUser currentUser = mAuth.getCurrentUser();
            if (currentUser != null) {
                // Пользователь уже аутентифицирован, перенаправьте его на следующую активность
                Intent intent = new Intent(MainActivity7.this, MainActivity11.class);
                startActivity(intent);
                finish(); // Закрыть текущую активность
            }
        }

        loginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String email = loginEditText.getText().toString();
                String password = passwordEditText.getText().toString();

                if (email.isEmpty() || password.isEmpty()) {
                    Toast.makeText(MainActivity7.this, "Please enter email and password", Toast.LENGTH_SHORT).show();
                } else {
                    mAuth.signInWithEmailAndPassword(email, password)
                            .addOnCompleteListener(MainActivity7.this, new OnCompleteListener<AuthResult>() {
                                @Override
                                public void onComplete(@NonNull Task<AuthResult> task) {
                                    if (task.isSuccessful()) {
                                        FirebaseUser user = mAuth.getCurrentUser();
                                        Toast.makeText(MainActivity7.this, "Authentication Successful.", Toast.LENGTH_SHORT).show();

                                        // Сохранить состояние запоминания пользователя
                                        SharedPreferences sharedPreferences = getSharedPreferences("login", MODE_PRIVATE);
                                        SharedPreferences.Editor editor = sharedPreferences.edit();
                                        editor.putBoolean("rememberMe", rememberMeCheckBox.isChecked());
                                        editor.apply();

                                        // Переход к следующей активности
                                        Intent intent = new Intent(MainActivity7.this, MainActivity11.class);
                                        startActivity(intent);
                                        finish(); // Закрыть текущую активность, чтобы пользователь не мог вернуться назад
                                    } else {
                                        Toast.makeText(MainActivity7.this, "Authentication Failed.", Toast.LENGTH_SHORT).show();
                                    }
                                }
                            });
                }
            }
        });

        signUpTextView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity7.this, MainActivity8.class);
                startActivity(intent);
            }
        });

        forgetPasswordTextView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity7.this, MainActivity9.class);
                startActivity(intent);
            }
        });
    }
}