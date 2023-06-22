package connectCode.model;

import lombok.Builder;
import lombok.Getter;

@Getter
public class FileDTO {

	private int file_no; // 참조하는 테이블의 고유번호
	private int file_serial_number; // 첨부하는 파일의 번호 값 (다중 파일 업로드)
	private String origin_name;
	private String physical_name;
	private String file_url;
	private long size;	// springframework 클래스인 multipartFile.getSize() 메소드가 long 타입으로 반환 하므로 long으로 맞춰줌
	private String extension;
	
	// 생성자
	@Builder 
	public FileDTO(String origin_name, String physical_name, String file_url, long size, String extension) {
		this.origin_name = origin_name;
		this.physical_name = physical_name;
		this.file_url = file_url;
		this.size = size;
		this.extension = extension;
	}
	
	// setter method
	public void setfile_no(int file_no) {
		this.file_no = file_no;
	}
	
	//추가한 코드
	public void setFile_serial_number(int num) {
		file_serial_number = num;
	}

	@Override
	public String toString() {
		return "FileDTO [file_no=" + file_no + ", file_serial_number=" + file_serial_number + ", origin_name="
				+ origin_name + ", physical_name=" + physical_name + ", file_url=" + file_url + ", size=" + size
				+ ", extension=" + extension + "]";
	}
	
	
}
