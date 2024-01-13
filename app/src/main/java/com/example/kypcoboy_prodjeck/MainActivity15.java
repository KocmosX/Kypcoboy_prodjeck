package com.example.kypcoboy_prodjeck;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity15 extends AppCompatActivity {

    private int ketchupCounter = 1;
    private int cheeseCounter = 1;
    private int burgerCounter = 1;
    private int saladCounter = 1;
    private TextView textViewTotalPrice;
    private TextView textViewKetchup;
    private TextView textViewCheese;
    private TextView textViewBurger;
    private TextView textViewSalad;
    private TextView textViewTime;
    private TextView textViewCalories;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main15);

        textViewTotalPrice = findViewById(R.id.textViewTotalPrice);
        textViewKetchup = findViewById(R.id.textViewKetchup);
        textViewCheese = findViewById(R.id.textViewCheese);
        textViewBurger = findViewById(R.id.textViewBurgerCounter);
        textViewSalad = findViewById(R.id.textViewSaladCounter);
        textViewTime = findViewById(R.id.textViewTime);
        textViewCalories = findViewById(R.id.textViewCalories);

        textViewKetchup.setText("Кетчуп: " + ketchupCounter);
        textViewCheese.setText("Сыр: " + cheeseCounter);
        textViewBurger.setText("Котлета: " + burgerCounter);
        textViewSalad.setText("Салат: " + saladCounter);

        Button buttonMinusKetchup = findViewById(R.id.buttonMinusKetchup);
        Button buttonPlusKetchup = findViewById(R.id.buttonPlusKetchup);
        Button buttonMinusCheese = findViewById(R.id.buttonMinusCheese);
        Button buttonPlusCheese = findViewById(R.id.buttonPlusCheese);
        Button buttonMinusBurger = findViewById(R.id.buttonMinusBurger);
        Button buttonPlusBurger = findViewById(R.id.buttonPlusBurger);
        Button buttonMinusSalad = findViewById(R.id.buttonMinusSalad);
        Button buttonPlusSalad = findViewById(R.id.buttonPlusSalad);
        ImageButton backButton1 = findViewById(R.id.backButton1); // Получаем кнопку backButton1

        updateTotalPrice();

        // Обработчик нажатия на кнопку backButton1
        backButton1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Создаем Intent для запуска MainActivity12
                Intent intent = new Intent(MainActivity15.this, MainActivity12.class);
                startActivity(intent); // Запускаем MainActivity12
            }
        });
        buttonMinusKetchup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (ketchupCounter > 0) {
                    ketchupCounter--;
                    textViewKetchup.setText("Кетчуп: " + ketchupCounter);
                    updateTotalPrice();
                }
            }
        });

        buttonPlusKetchup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ketchupCounter++;
                textViewKetchup.setText("Кетчуп: " + ketchupCounter);
                updateTotalPrice();
            }
        });

        buttonMinusCheese.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (cheeseCounter > 0) {
                    cheeseCounter--;
                    textViewCheese.setText("Сыр: " + cheeseCounter);
                    updateTotalPrice();
                }
            }
        });

        buttonPlusCheese.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                cheeseCounter++;
                textViewCheese.setText("Сыр: " + cheeseCounter);
                updateTotalPrice();
            }
        });

        buttonMinusBurger.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (burgerCounter > 0) {
                    burgerCounter--;
                    textViewBurger.setText("Котлета: " + burgerCounter);
                    updateTotalPrice();
                }
            }
        });

        buttonPlusBurger.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                burgerCounter++;
                textViewBurger.setText("Котлета: " + burgerCounter);
                updateTotalPrice();
            }
        });

        buttonMinusSalad.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (saladCounter > 0) {
                    saladCounter--;
                    textViewSalad.setText("Салат: " + saladCounter);
                    updateTotalPrice();
                }
            }
        });

        buttonPlusSalad.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                saladCounter++;
                textViewSalad.setText("Салат: " + saladCounter);
                updateTotalPrice();
            }
        });
    }

    private void updateTotalPrice() {
        double basePrice = 150;
        double ketchupPrice = 1.5;
        double cheesePrice = 2.0;
        double burgerPrice = 3.0;
        double saladPrice = 1.5;

        double totalPrice = basePrice + (ketchupCounter * ketchupPrice) + (cheeseCounter * cheesePrice)
                + (burgerCounter * burgerPrice) + (saladCounter * saladPrice);
        textViewTotalPrice.setText(String.format("₽%.2f", totalPrice));

        // Update preparation time based on the number of ingredients
        int preparationTime = 15 + (ketchupCounter * 2) + (cheeseCounter * 3) + (burgerCounter * 5) + (saladCounter * 2);
        textViewTime.setText(String.format("%d min", preparationTime));

        // Update calorie count based on the number of ingredients
        int calorieCount = 290 + (ketchupCounter * 5) + (cheeseCounter * 10) + (burgerCounter * 15) + (saladCounter * 8);
        textViewCalories.setText(String.format("%d cal", calorieCount));
    }
}
