package com.example.kypcoboy_prodjeck;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.google.firebase.auth.FirebaseAuth;

public class MainActivity8 extends AppCompatActivity {

    private EditText emailEditText, passwordEditText;
    private Button signUpButton;
    private TextView loginText; // Added TextView for login text

    private FirebaseAuth mAuth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main8);

        mAuth = FirebaseAuth.getInstance();

        // Checking the current authentication state
        if (mAuth.getCurrentUser() != null) {
            startActivity(new Intent(MainActivity8.this, MainActivity11.class));
            finish();
        }

        emailEditText = findViewById(R.id.editTextEmail);
        passwordEditText = findViewById(R.id.passwordEditText);
        signUpButton = findViewById(R.id.Sign_UP);
        loginText = findViewById(R.id.termsTextView); // Initialize login text view

        signUpButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Sign up logic here
            }
        });

        // Set OnClickListener for the login text view
        loginText.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity8.this, MainActivity7.class));
                finish();
            }
        });
    }
}