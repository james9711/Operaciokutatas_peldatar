import { Component, OnInit } from '@angular/core';
import {MatSnackBar} from '@angular/material';

@Component({
  selector: 'app-chapter1',
  templateUrl: './chapter1.component.html',
  styleUrls: ['./chapter1.component.css', '../app.component.css']
})

export class Chapter1Component implements OnInit {

  constructor(private snackBar: MatSnackBar) { }

  ngOnInit() {
  }

  messageFailed = "A kód nem elérhető!";
  messageSuccess = "A kód sikeresen letöltődött!";
  action = "CLOSE";

  downloadFailedSnackBar() {
    this.snackBar.open(this.messageFailed, this.action, {
      duration: 4000,
    });
    console.log("no file found");
  }

  downloadSuccessSnackBar() {
    this.snackBar.open(this.messageSuccess, this.action, {
      duration: 4000,
    });
    console.log("files successfully downloaded");
  }

  //R codes
  downloadRcode(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_01.R");
    window.location.href='../../assets/sources/files/kodok/r/1 fejezet feladatai/I_01(intpoint package).R';
    this.downloadSuccessSnackBar();
  }

  downloadRcode2(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_02.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode3(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_03.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode4(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_04.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode5(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_05.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode6(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_06.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode7(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_07.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode8(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_08.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode9(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_09.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode10(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_10.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode11(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_11.R");
    this.downloadSuccessSnackBar();
  }

  //Lingo codes
  downloadLingocode(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_01.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode2(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_02.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode3(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_03.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode4(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_04.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode5(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_05.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode6(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_06.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode7(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_07.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode8(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_08.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode9(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_09.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode10(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_10.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode11(){
    this.downloadFailedSnackBar();
  }

  //SAS/ OR codes
  downloadSascode(){
    this.downloadFailedSnackBar();
  }

  downloadSascode2(){
    window.open("../../assets/sources/files/kodok/sas or/1 fejezet feladatai/G.2.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode3(){
    window.open("../../assets/sources/files/kodok/sas or/1 fejezet feladatai/G.3.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode4(){
    window.open("../../assets/sources/files/kodok/sas or/1 fejezet feladatai/G.4.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode5(){
    window.open("../../assets/sources/files/kodok/sas or/1 fejezet feladatai/G.5.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode6(){
    window.open("../../assets/sources/files/kodok/sas or/1 fejezet feladatai/G.6.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode7(){
    this.downloadFailedSnackBar();
  }

  downloadSascode8(){
    this.downloadFailedSnackBar();
  }

  downloadSascode9(){
    this.downloadFailedSnackBar();
  }

  downloadSascode10(){
    this.downloadFailedSnackBar();
  }

  downloadSascode11(){
    this.downloadFailedSnackBar();
  }

}
