/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.joguinho.adivinhacao;

import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author GAMER
 */
public class JoguinhoAdivinhacao {

    public static void main(String[] args) {
        Scanner resp_usu = new Scanner(System.in);
        
        Random rd = new Random();
        
        
        boolean repetir = true;
        int armazenar_resp_usu, maximo, minimo;
        
        minimo = 1;
        maximo = 10;
        
        
        int nume_randomico = rd.nextInt(maximo - minimo + 1) + minimo;
        
        
        
        
        while(repetir){
            
            System.out.println("-------JOGO DE ADIVINHAÇÃO--------");
            System.out.println("Qual será o número? [Digite um número de 1 até 10]:");
            armazenar_resp_usu = resp_usu.nextInt();
            
            
            
            if(armazenar_resp_usu == nume_randomico){
            System.out.println("Você a certou!");
            repetir = false;
        
            }else{
                
                System.out.println("Você ainda não conseguiu adivinhar.Bora lá, tente novamente!");
            }
        
            
            
            resp_usu.nextLine();
            
            System.out.println("Deseja continuar? (S- sim N- não): ");
            String continuar_usuario = resp_usu.nextLine();
            
            
            
            //Transformar em letra maiúscula
            String respostaUsuario = String.valueOf(continuar_usuario);
            respostaUsuario = respostaUsuario.toUpperCase();
            
            
            
            
            if (continuar_usuario.equalsIgnoreCase("S")) {
            // Código se a resposta for "S"
            } else if (continuar_usuario.equalsIgnoreCase("N")) {
                repetir = false;
            } else {
            System.out.println("Resposta inválida. Por favor, digite s para continuar ou n para encerrar.");
            }

          
        }
        
        
        
    }
}
