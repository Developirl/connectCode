package connectCode.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ResourceConfiguration implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		///home/ec2-user/apps/connectCode/upload-files/
		registry.addResourceHandler("/download/**").addResourceLocations("file:///home/ec2-user/apps/connectCode/upload-files/");
	}
}
