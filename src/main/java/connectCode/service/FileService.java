package connectCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import connectCode.mapper.FileMapper;
import connectCode.model.FileDTO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // 생성자 주입을 위한 어노테이션
public class FileService {
	
	@Autowired
	private FileMapper fileMapper;
	
	@Transactional // 오류 발생 시, 원상태로 돌리기 위한 어노테이션 (트랜잭션 처리)
	public void saveFiles(int file_no, List<FileDTO> files) {
	// 업로드된 파일이 없다면 로직 종료, 파일 있다면 file_no = 현재 file_no로 셋팅해서 테이블에 정보 저장
		if (CollectionUtils.isEmpty(files)) {
			return;
		}
		
		for (FileDTO file : files) {
			// List files을 순차적으로 조회하여 DTO에 넣어줌 
			file.setfile_no(file_no);
			System.out.println("**********************file:"+file);
			
			//여기부터 추가 코드
			int file_serial_number = fileMapper.getMaxSerial(file_no) ;
			file.setFile_serial_number(file_serial_number);
			fileMapper.dbSaveFile(file);
			
		}
		//fileMapper.saveAll(files);
	}
}
