package spring.service;

import org.springframework.stereotype.Service;

@Service
public interface EncryptService {
	String encrypt(String pw, String salt, int loop) throws Exception;

	
}
