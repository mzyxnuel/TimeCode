package timecode.view;

import java.io.IOException;

import atlantafx.base.theme.CupertinoDark;
import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.stage.Stage;
import timecode.model.FxmlManager;

public class App extends Application {
   private static Group root;
   private static Scene scene;
   private static Stage stage;

   @Override
   public void start(Stage x) throws IOException {
      root = new Group();
      scene = new Scene(root);
      stage = new Stage();

      Application.setUserAgentStylesheet(new CupertinoDark().getUserAgentStylesheet());
      scene = new Scene(new FxmlManager().loadFXML("/ui/login"));

      stage.setScene(scene);
      stage.setResizable(false); // TODO
      stage.show();
   }

   public static Stage getStage() {
      return stage;
   }

   public static void setScene(String fxml) {
      scene.setRoot(new FxmlManager().loadFXML(fxml));
   }

   public static void setRoot(Node node) {
      root.getChildren().add(node);
   }

   public static void main(String[] args) {
      launch();
   }
}