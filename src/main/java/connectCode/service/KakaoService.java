package connectCode.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoService {

	public String getKakaoAccessToken (String code) {
	    String access_Token = "";
	    String refresh_Token = "";
	    String requestURL = "https://kauth.kakao.com/oauth/token";

	    try {
	        URL url = new URL(requestURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	        conn.setRequestMethod("POST");
	        // setDoOutput()은 OutputStream으로 POST 데이터를 넘겨 주겠다는 옵션이다.
	        // POST 요청을 수행하려면 setDoOutput()을 true로 설정한다.
	        conn.setDoOutput(true);

	        // POST 요청에서 필요한 파라미터를 OutputStream을 통해 전송
	        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        String sb = "grant_type=authorization_code" +
	                "&client_id=01bcec8ab48df640b4c423328a4ea224" + // REST_API_KEY
	                "&redirect_uri=http://localhost:80/member/kakaoLogin" + // REDIRECT_URI
	                "&code=" + code;
	        bufferedWriter.write(sb);
	        bufferedWriter.flush();

	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);

	        // 요청을 통해 얻은 데이터를 InputStreamReader을 통해 읽어 오기
	        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        StringBuilder result = new StringBuilder();

	        while ((line = bufferedReader.readLine()) != null) {
	            result.append(line);
	        }
	        System.out.println("response body : " + result);

	        @SuppressWarnings("deprecation")
			JsonParser parser = new JsonParser();
	        
	        @SuppressWarnings("deprecation")
			JsonElement element = parser.parse(result.toString());

	        access_Token = element.getAsJsonObject().get("access_token").getAsString();
	        refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	        System.out.println("accessToken : " + access_Token);
	        System.out.println("refreshToken : " + refresh_Token);
	        

	        bufferedReader.close();
	        bufferedWriter.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return access_Token;
	}
	
	public HashMap<String, Object> getUserInfo(String accessToken) {
	    HashMap<String, Object> userInfo = new HashMap<String, Object>();
	    String postURL = "https://kapi.kakao.com/v2/user/me";

	    try {
	        URL url = new URL(postURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");

	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        StringBuilder result = new StringBuilder();

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }
	        System.out.println("response body : " + result);

	        @SuppressWarnings("deprecation")
			JsonParser parser = new JsonParser();
	        
	        @SuppressWarnings("deprecation")
			JsonElement element = parser.parse(result.toString());
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        Long id = element.getAsJsonObject().get("id").getAsLong();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
	        String gender = kakaoAccount.getAsJsonObject().get("gender").getAsString();
	        String birthday = kakaoAccount.getAsJsonObject().get("birthday").getAsString();

	        System.out.println(properties);
	        System.out.println(kakaoAccount);
	        
	        System.out.println(id);
	        System.out.println(nickname);
	        System.out.println(email);
	        System.out.println(gender);
	        System.out.println(birthday);
	        
	        userInfo.put("id", id);
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
	        userInfo.put("gender", gender);
	        userInfo.put("birthday", birthday);

	    } catch (IOException exception) {
	        exception.printStackTrace();
	    }

	    return userInfo;
	}
	
}
