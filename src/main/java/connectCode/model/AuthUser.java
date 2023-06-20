package connectCode.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class AuthUser extends User{
	
	private static final long serialVersionUID = 1L;
	
	private MemberDTO member;
	private String mentor_id;
	
	public AuthUser(MemberDTO member) {
		super(member.getId(), member.getPassword(), mapAuthorities(member.getClassification()));
		
		this.member = member;
	}
	
	private static Collection<? extends GrantedAuthority> mapAuthorities(Integer classification) {
	    List<GrantedAuthority> authorities = new ArrayList<>();
	    if (classification != null) {
	        authorities.add(new SimpleGrantedAuthority("ROLE_" + classification));
	    }
	    return authorities;
	}
}
