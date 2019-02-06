import { Component } from '@angular/core';
import {MatSnackBar} from '@angular/material';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  constructor(private snackBar: MatSnackBar) { }

  messageFailed = "A kód nem elérhető!";
  messageSuccess = "A kód sikeresen letöltődött!";
  action = "CLOSE";

  basicDownloadFailedSnackBar() {
    this.snackBar.open(this.messageFailed, this.action, {
      duration: 4000,
    });
    console.log("no file found");
  }

  basicDownloadSuccessSnackBar() {
    this.snackBar.open(this.messageSuccess, this.action, {
      duration: 4000,
    });
    console.log("files successfully downloaded");
  }

}
