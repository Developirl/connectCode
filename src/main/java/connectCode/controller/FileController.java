package connectCode.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import connectCode.model.FileDTO;
import connectCode.service.FileService;
import connectCode.service.FileUtils;

@Controller
public class FileController {
	
	@Autowired
	FileService fs;

	@Autowired
	FileUtils fu;

	@RequestMapping("filedownload")
	public ResponseEntity<Resource> downloadFile(FileDTO fileDTO, int mentor_no) {

		System.out.println("fileDTO: "+fileDTO);
		
		// 첨부파일 상세 정보
		FileDTO file = fs.file(fileDTO);
		System.out.println("file;;;;;"+file);

		Resource resource = fu.readFileAsResource(file);
		try {
			String filename = URLEncoder.encode(file.getOrigin_name(), "UTF-8");
			return ResponseEntity.ok()
					.contentType(MediaType.APPLICATION_OCTET_STREAM)

					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; fileName=\"" + filename + "\";")
					.header(HttpHeaders.CONTENT_LENGTH, file.getSize()+"")
					.body(resource);
		}catch(UnsupportedEncodingException e) {
			throw new RuntimeException("filename encoding failed: " +file.getOrigin_name());
		}
		
	}
	
	
}
