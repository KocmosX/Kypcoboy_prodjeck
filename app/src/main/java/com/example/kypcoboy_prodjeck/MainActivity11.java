package com.example.kypcoboy_prodjeck;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity11 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main11);

        // Обработчик нажатия на объект "Избрано на Super Foodoo"
        findViewById(R.id.textViewFeatured1).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity11.this, MainActivity13.class);
                startActivity(intent);
            }
        });

        // Обработчик нажатия на объект "HotSpots"
        findViewById(R.id.hotSpotsCardView).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity11.this, MainActivity12.class);
                startActivity(intent);
            }
        });
    }
}