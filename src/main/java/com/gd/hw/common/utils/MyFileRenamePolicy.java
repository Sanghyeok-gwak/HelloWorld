package com.gd.hw.common.utils;

import java.io.File;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) { 
		
		
		
		String originalFilename = originFile.getName(); 
		
		// 파일명 수정 작업
		// 1. 파일업로드한 시간 (long currentTime)
		long currentTime = System.currentTimeMillis(); // 1970/01/01 부터 현재시간까지 경과한 시간을 밀리세컨초로 반환
		// 2. 랜덤숫자 5자리 (10000~99999) (int ranNum)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		// 3. 원본파일의 확장자 (String ext)
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		
		String filesystemName = currentTime + "_" + ranNum + ext;
		
		return new File(originFile.getParent(), filesystemName);
	}

}