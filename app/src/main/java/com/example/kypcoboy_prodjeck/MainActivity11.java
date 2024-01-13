package com.example.kypcoboy_prodjeck;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity11 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main11);

        TextView textViewFeatured1 = findViewById(R.id.textViewFeatured1);
        TextView textViewFeatured = findViewById(R.id.textViewFeatured);

        textViewFeatured1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity11.this, MainActivity13.class);
                startActivity(intent);
            }
        });

        textViewFeatured.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity11.this, MainActivity12.class);
                startActivity(intent);
            }
        });
    }
}