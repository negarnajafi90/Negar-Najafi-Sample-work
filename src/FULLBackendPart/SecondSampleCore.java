package FULLBackendPart;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpRequest.BodyPublisher;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpHost;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class SampleServlet
 */
@WebServlet(name = "SecondSampleCore2", urlPatterns = { "/SecondSampleCore2" })
public class SecondSampleCore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecondSampleCore() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at here: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		Enumeration enumeration = request.getParameterNames();
        //Map<String, Object> modelMap = new HashMap<>();
        JSONObject jsonObject = new JSONObject();
        //String value = request.getParameter("buttonClicked");
        //String testValueId = request.getParameter("testValueId");
        //System.out.print("button: ");
        //System.out.println(value);
        
        //System.out.print("test value: ");
        //System.out.print(testValueId);
        while(enumeration.hasMoreElements()){
            String parameterName = (String)enumeration.nextElement();
            
            //modelMap.put(parameterName, request.getParameter(parameterName));
            
            jsonObject.put(parameterName,request.getParameter(parameterName));
            
            //Here is all data with name and parameter
            //System.out.print("Name1: ");
            //System.out.print(parameterName);
            //System.out.print("    Value: ");
            //System.out.println(request.getParameter(parameterName));
            //System.out.println();
        }
        
       
        
        var uri = URI.create("https://api.unibackend.com/get/parser");
        
        var client = HttpClient.newHttpClient();
        var reqq = HttpRequest
                .newBuilder()
                .uri(uri)
                .header("Content-Type", "application/json")
                .POST(BodyPublishers.ofString(jsonObject.toJSONString()))
                .build();
        HttpResponse<String> resp;
		try {
			resp = client.send(reqq, HttpResponse.BodyHandlers.ofString());
	        System.out.println(resp.statusCode());
	        System.out.println(resp.body());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
