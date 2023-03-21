package RDS;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import com.google.gson.Gson;

@WebServlet("/data")
public class DataServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // Set the response content type to JSON
    response.setContentType("application/json");

    // Get the data to return as a JSON string
    //String json = getDataAsJsonString();

    // Get the printwriter to write the JSON string to the response
    PrintWriter out = response.getWriter();

    // Write the JSON string to the response
    //out.print(json);
    out.flush();
  }

  //private String getDataAsJsonString() {
    // Create a Java object to represent the data
    // (e.g. a List of objects, a single object, etc.)
    Object data = "someData";

    // Use the Gson library to convert the Java object to a JSON string
   // Gson gson = new Gson();
   // String json = gson.toJson(data);
    //return json;
  }

//}*/