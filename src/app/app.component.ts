import { Component } from '@angular/core';
import {MatSnackBar} from '@angular/material';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  constructor(private snackBar: MatSnackBar) { }

  messageNoContent = "A választott fejezethez még nem tartozik tananyag!";
  messageFailed = "A kód nem elérhető!";
  messageSuccess = "A kód sikeresen letöltődött!";
  action = "CLOSE";

  noContentForTheChoosentopicSnackBar() {
    this.snackBar.open(this.messageNoContent, this.action, {
      duration: 4000,
    });
  }

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

  openChapter6(){
    this.noContentForTheChoosentopicSnackBar();
  }

  openChapter7(){
    this.noContentForTheChoosentopicSnackBar();
  }

}
