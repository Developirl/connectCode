package connectCode.model;

public class FindMentorBeanFactory {

	public String[] techStacks() {
		return new String[] { "Java", "Python", "JavaScript", "C#", "C++", "Ruby", "PHP", "Swift", "Go", "Kotlin",
				"HTML/CSS", "React", "Angular", "Vue.js", "Node.js", "Express.js", "Django", "Flask", "ASP.NET",
				"Spring", "Spring Boot", "MySQL", "PostgreSQL", "Oracle", "MongoDB", "Redis", "SQLite", "AWS", "Azure",
				"Google Cloud Platform", "Docker", "Kubernetes", "Git", "SVN", "Jenkins", "Jira", "Agile/Scrum",
				"RESTful API", "GraphQL" };
	}
	
	
	public String[] region() {
		return new String[] {
				"서울", "인천", "부산", "대전", "대구", "울산", "광주", "제주특별자치도", "세종특별자치시", "경기",
				"강원", "충북", "충남", "경북", "경남", "전북", "전남"
		};
	}
	
	
}
