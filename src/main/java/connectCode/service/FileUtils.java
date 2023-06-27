package connectCode.service;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import connectCode.model.FileDTO;

// 파일 업로드 또는 삭제하는 클래스

@Component
public class FileUtils {

	private String uploadPath = Paths.get("C:","connectCode","upload-files").toString();
	
	/* 다중 파일 업로드 */
	public List<FileDTO> uploadFiles(List<MultipartFile> multipartFiles) {
		List<FileDTO> files = new ArrayList<>();
		
		for (MultipartFile multipartFile : multipartFiles) {
			System.out.println("들어왔나요?");
			if (multipartFile.isEmpty()) {
				continue;
			}
			files.add(uploadFile(multipartFile));
		}
		
		// DB에 저장할 파일 정보 List
		return files;
	}
	
	/* 단일 파일 업로드 */
	public FileDTO uploadFile(MultipartFile multipartFile) {
		
		if(multipartFile.isEmpty()) {
			return null;
		}
		
		String saveName = generateSaveFilename(multipartFile.getOriginalFilename());
		//String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd")).toString();
		String uploadPath = getUploadPath() + File.separator + saveName;
		File uploadFile = new File(uploadPath);
		String extension = StringUtils.getFilenameExtension(multipartFile.getOriginalFilename());
		
		try {
			multipartFile.transferTo(uploadFile);
		}catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		// DB에 저장할 파일 정보
		return FileDTO.builder()
				.origin_name(multipartFile.getOriginalFilename())
				.physical_name(saveName)
				.file_url(uploadPath)
				.size(multipartFile.getSize())
				.extension(extension)
				.build();
	}
	
	/* 저장 파일명 생성 */
	// filename = 원본 파일명
	private String generateSaveFilename(String filename) {
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		String extension = getFileExtension(filename);
		return uuid + "." + extension; // 디스크에 저장할 파일명
	}
	
	// 확장자 가져오기
	private String getFileExtension(String filename) {
	    int dotIndex = filename.lastIndexOf(".");
	    if (dotIndex != -1 && dotIndex < filename.length() - 1) {
	        return filename.substring(dotIndex + 1);
	    }
	    return ""; // 확장자가 없는 경우 빈 문자열 반환
	}
	
	/* 업로드 경로 반환 */
	private String getUploadPath() {
		return makeDirectories(uploadPath); // 업로드 경로
	}
	
	/* 업로드 경로 반환 */
//	private String getUploadPath(String addPath) {
//		return makeDirectories(uploadPath + File.separator + addPath);
//	}
	
    /* 업로드 폴더(디렉토리) 생성 */
    private String makeDirectories(String path) {
        File dir = new File(path);
        if (dir.exists() == false) {
            dir.mkdirs();
        }
        return dir.getPath();
    }
    
    // 파일 다운로드
    public Resource readFileAsResource(final FileDTO file) {
    	
    	String filename = file.getFile_url();
 //   	String fileExtension = file.getExtension();

//    	String filePathString = filename + "." + fileExtension;
    	
    	// System.out.println("filename: "+filename);
    	
    	Path filePath = Paths.get(filename);
  
    	 System.out.println("filePath: "+filePath);
    	
    	try {
    		Resource resource = new UrlResource(filePath.toUri());
    		if(resource.exists() == false || resource.isFile() == false) {
    			throw new RuntimeException("file not found: " + filePath.toString());
    		}
    		return resource;
    	} catch(MalformedURLException e) {
    		throw new RuntimeException("file not found: " + filePath.toString());
    	}
    	
    }
    
    public boolean deleteFile(FileDTO file) {
    	File old_file = new File(file.getFile_url());
    	boolean result = old_file.delete();
		
		return result;
    }
    
}
