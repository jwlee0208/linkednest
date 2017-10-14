package net.linkednest.www.profile.dto;

import org.apache.ibatis.type.Alias;

@Alias("profile.profileStreamDto")
public class ProfileStreamDto {
	private int streamId;
	private int	profileId;
	private String streamTitle;
	private String streamUrl;
	
	public int getStreamId() {
		return streamId;
	}
	public void setStreamId(int streamId) {
		this.streamId = streamId;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	public String getStreamTitle() {
		return streamTitle;
	}
	public void setStreamTitle(String streamTitle) {
		this.streamTitle = streamTitle;
	}
	public String getStreamUrl() {
		return streamUrl;
	}
	public void setStreamUrl(String streamUrl) {
		this.streamUrl = streamUrl;
	}
	@Override
	public String toString() {
		return "ProfileStreamDto [streamId=" + streamId + ", profileId=" + profileId + ", streamTitle=" + streamTitle
				+ ", streamUrl=" + streamUrl + "]";
	}
}
