package it.mgcg.exceptions;


import java.util.*;


public class NotFoundException extends Exception {

   /**
    * Costuttore per NotFoundException. Riceviamo un messaggio di errore ed lo sciviamo e mostaimo a schermo
    */
    public NotFoundException(String msg) {
           super(msg);
    }

}