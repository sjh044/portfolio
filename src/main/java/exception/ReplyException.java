package exception;

public class ReplyException extends RuntimeException {
	private String url;
	public ReplyException(String msg, String url) {
		super(msg);
		this.url=url;
	}
	public String getUrl() {
		return url;
	}
}
