package com.example.kypcoboy_prodjeck;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import com.example.kypcoboy_prodjeck.MainActivity7;
import com.example.kypcoboy_prodjeck.R;

public class MainActivity9 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main9);

        TextView loginTextView = findViewById(R.id.loginTextView);
        loginTextView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity9.this, MainActivity7.class);
                startActivity(intent);
            }
        });

        Button submitButton = findViewById(R.id.saadas);
        submitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity9.this, MainActivity10.class);
                startActivity(intent);
            }
        });
    }
}