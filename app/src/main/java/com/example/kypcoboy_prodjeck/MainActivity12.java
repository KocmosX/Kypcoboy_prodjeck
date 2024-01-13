package com.example.kypcoboy_prodjeck;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

public class MainActivity12 extends AppCompatActivity {

    private EditText searchEditText;
    private LinearLayout itemsLayout;
    private Button searchButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main12);

        searchEditText = findViewById(R.id.editTextSearch);
        itemsLayout = findViewById(R.id.itemsLayout);
        searchButton = findViewById(R.id.searchButton);

        searchButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String query = searchEditText.getText().toString().trim();
                boolean itemFound = checkIfItemExists(query);
                if (itemFound) {
                    Intent intent = new Intent(MainActivity12.this, MainActivity15.class);
                    startActivity(intent);
                }
            }
        });

        // Остальные обработчики событий остаются без изменений
    }

    private boolean checkIfItemExists(String query) {
        for (int i = 0; i < itemsLayout.getChildCount(); i++) {
            View child = itemsLayout.getChildAt(i);
            if (child instanceof CardView) {
                CardView itemCardView = (CardView) child;
                TextView itemNameTextView = itemCardView.findViewById(R.id.textView2);
                if (itemNameTextView != null) {
                    String itemName = itemNameTextView.getText().toString().toLowerCase();
                    if (itemName.contains(query.toLowerCase())) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
