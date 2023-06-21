package connectCode.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.net.ssl.HttpsURLConnection;
import java.net.URL;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import java.text.ParseException;
import java.util.Map;

@Service
public class PaymentService {

	
	//@Value("impKey")
	private String impKey="2186618541054470";

	//@Value("impSecretKey")
	private String impSecret="x4P1ndP7RQsdC0kG26uycOp0efeF0WeIVKUyfzJlLzBPUqDJna7g68KqJAeIMK6hxk9bRxC3rpjlHLuF";

	public String getToken() throws Exception {

		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", impKey);
		json.addProperty("imp_secret", impSecret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();


		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}

	
    //결제 정보 불러오기
	public String paymentInfo(String imp_uid, String access_token) throws Exception {
		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", access_token);
		conn.setDoOutput(true);

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		JSONParser parser = new JSONParser();

		JSONObject p = (JSONObject) parser.parse(br.readLine());
		
		String response = p.get("response").toString();
		
		p = (JSONObject) parser.parse(response);
		
		String amount = p.get("amount").toString();
		return amount;
	}
	
	public void payMentCancle(String access_token, String imp_uid, String amount,String reason) throws IOException, ParseException {
		System.out.println("imp_uid = " + imp_uid);
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");

		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);

		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();

		json.addProperty("reason", reason);
		json.addProperty("imp_uid", imp_uid);
		json.addProperty("amount", amount);
		json.addProperty("checksum", amount);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));			
		
	}
	
	
	
}
