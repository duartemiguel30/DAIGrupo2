package com.example.dai_tub;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class PerfilActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.perfil);

        // Referências aos elementos do layout
        TextView greetingText = findViewById(R.id.greetingText);
        TextView fullNameText = findViewById(R.id.fullNameText);
        TextView emailText = findViewById(R.id.emailText);
        TextView nifText = findViewById(R.id.nifText);
        TextView passNumberText = findViewById(R.id.passNumberText);
        TextView balanceText = findViewById(R.id.balanceText);
        TextView backButton = findViewById(R.id.backButton); // Adicionando referência ao botão BACK

        // Definindo os valores fictícios para os campos do perfil
        String nomeUsuario = "João Silva";
        String emailUsuario = "joao.silva@example.com";
        String nifUsuario = "123456789";
        String numeroPasse = "987654321";
        String saldo = "R$ 100,00";

        // Definindo os valores nos elementos TextView
        greetingText.setText(getString(R.string.greeting_text, nomeUsuario));
        fullNameText.setText(nomeUsuario);
        emailText.setText(emailUsuario);
        nifText.setText(nifUsuario);
        passNumberText.setText(numeroPasse);
        balanceText.setText(saldo);

        // Adicionando um listener de clique ao botão BACK
        backButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Chame onBackPressed para voltar à atividade anterior
                onBackPressed();
            }
        });
    }
}
