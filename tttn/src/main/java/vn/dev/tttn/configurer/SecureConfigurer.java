package vn.dev.tttn.configurer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import vn.dev.tttn.service.UserDetailsServiceImpl;



@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecureConfigurer extends WebSecurityConfigurerAdapter{
	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		
		http.csrf().disable().authorizeRequests() //bat dau cau hinh: tat ca cac requests tu
												  //trinh duyet deu duoc bat trong phuong thuc nay
		
		//Cho phep cac request, static resources khong bi rang buoc login
		.antMatchers("/customer/**", "/FileUploads/**", "/admin/**","/user/**", "/login", "/logout").permitAll()
		
		//Cac requests co action bat dau voi "/manager/..." phai xac thuc (login) moi duoc vao (authenticated())
//		.antMatchers("/manager/**").authenticated()
		.antMatchers("/boss/**").hasAnyAuthority("BOSS") //CHI ROLE ADMINISTRATOR MOI VAO DUOC CAC TRANG ADMINISTRATOR
		.antMatchers("/manager/**").hasAnyAuthority("BOSS", "MANAGER") //hasAnyAuthority cho phép duyệt nhiều role cùng một lệnh
//		.antMatchers("/staff/**").hasAnyAuthority("STAFF")
		.and()
		
		 
		
		//neu request den trang (admin) ma chua xac thuc thi redirect ve trang login
		.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url")
		
//		.defaultSuccessUrl("/manager/home-admin", true) //login thanh cong thi tro ve trang home.jsp
		
		// chuyển đến request phù hợp với Role
		.successHandler(new UrlAuthenticationSuccessHandler())
		
		.failureUrl("/login?login_error=true") //login khong thanh cong (o lai trang login voi co bao loi)
		
		.and()
		
		//Cau hinh phan logout: logout tro ve trang login
		.logout().logoutUrl("/logout").logoutSuccessUrl("/login").invalidateHttpSession(true)
		.deleteCookies("JSESSIONID");
		
//		.and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400);
	}
	
	
	
	//Cau hinh phan dang nhap bang tai khoan trong DB
		@Autowired
		private UserDetailsServiceImpl userDetailsService; //bean
		
		@Autowired //Tham so cua phuong thuc (auth) duoc inject
		public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception { 
			//auth tim cac bean kieu AuthenticationManagerBuilder
			auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
		}
		
		

//		public static void main(String[] args) {
//			System.out.println(new BCryptPasswordEncoder(4).encode("administrator")); // mat khau de ma hoa
//			System.out.println(new BCryptPasswordEncoder(4).encode("admin01"));
//			System.out.println(new BCryptPasswordEncoder(4).encode("admin02"));
//			System.out.println(new BCryptPasswordEncoder(4).encode("customer01"));
//			System.out.println(new BCryptPasswordEncoder(4).encode("customer02"));
////			$2a$04$CGSp7ZE7B6IBEJlCENxAvOB7FQ6ufQWjE9UX05VV7cUjgLUTf1U5q
////			$2a$04$H.xQyliTaNphBprYvXydK.Jhm6jw.oS9G5ft9LKzqIzsI4Epraaeu
////			$2a$04$J1XyW.A//TIoh47CJXFo2OvSOQTRcDPkxTDTbQ95ogQ.LMJKcsmLy
////			$2a$04$WzrHwgiSCM6K7aI8l.kVr.6QJ.elModN0Fb5vnG7xsah2.jAgjI0y
////			$2a$04$2UsjV1sNEysDBRKbraj9ROA.7naIp7dRNVenq0E2Fxh8./VjG.02W
//
//		}
}
