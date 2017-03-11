package net.linkednest.share.service;

import javax.servlet.http.HttpSession;

import net.linkednest.common.dto.ShareDto;
import org.springframework.ui.Model;

import net.linkednest.common.dto.ShareDto;

public interface ShareService {
    public ShareDto getShareInfo(ShareDto shareDto)    throws Exception;
    
    public int       insertShareInfo(ShareDto shareDto) throws Exception;

    public int       updateShareInfo(ShareDto shareDto) throws Exception;
    
    public void      setShareInfo(Model model, HttpSession session);
    
}
