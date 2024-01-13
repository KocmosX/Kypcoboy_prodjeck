package com.example.kypcoboy_prodjeck;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;

public class MainActivity9 extends AppCompatActivity {

    private static final String TAG = "ResetPasswordEmail";

    private EditText editTextEmail;
    private Button saadas; // изменили название кнопки

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main9);

        editTextEmail = findViewById(R.id.editTextEmail);
        saadas = findViewById(R.id.saadas); // изменили идентификатор кнопки

        saadas.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String email = editTextEmail.getText().toString().trim();
                sendPasswordResetEmail(email); // изменили название вызываемого метода
            }
        });
    }

    private void sendPasswordResetEmail(String email) {
        FirebaseAuth.getInstance().sendPasswordResetEmail(email)
                .addOnCompleteListener(new OnCompleteListener<Void>() {
                    @Override
                    public void onComplete(@NonNull Task<Void> task) {
                        if (task.isSuccessful()) {
                            Log.d(TAG, "Password reset email sent");
                            // Handle success, navigate to password reset activity
                            Intent intent = new Intent(MainActivity9.this, MainActivity7.class);
                            startActivity(intent);
                            finish();
                        } else {
                            Log.e(TAG, "Failed to send password reset email");
                            // Handle failure
                        }
                    }
                });
    }
}