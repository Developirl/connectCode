package connectCode.mapper;

import java.util.List;

import connectCode.model.FileDTO;

public interface FileMapper {

	// 파일 정보 DB에 저장
	// 여러 파일 정보를 한번에 저장하기 위해 List 타입으로 선언
	/* public void saveAll(List<FileDTO> files); */
	 public void saveAll(List<FileDTO> list);

	 
	 // 추가 코드
	public int getMaxSerial(int file_no);
	public void dbSaveFile(FileDTO file); 
	
}
