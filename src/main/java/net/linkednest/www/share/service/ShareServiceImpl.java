package net.linkednest.www.share.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

<<<<<<< HEAD:src/main/java/net/linkednest/share/service/ShareServiceImpl.java
import net.linkednest.www.common.dto.ShareDto;
=======
import net.linkednest.common.dto.ShareDto;
>>>>>>> 3acc487a5ec59c3fd34001e63e768877320b663a:src/main/java/net/linkednest/www/share/service/ShareServiceImpl.java
import net.linkednest.www.user.dto.UserDto;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

<<<<<<< HEAD:src/main/java/net/linkednest/share/service/ShareServiceImpl.java
import net.linkednest.share.dao.ShareDao;
=======
import net.linkednest.www.share.dao.ShareDao;
>>>>>>> 3acc487a5ec59c3fd34001e63e768877320b663a:src/main/java/net/linkednest/www/share/service/ShareServiceImpl.java

@Service("ShareServiceImpl")
public class ShareServiceImpl implements ShareService{
    
    @Inject
    private ShareDao shareDao;
    
    @Override
    public ShareDto getShareInfo(ShareDto shareDto) throws Exception{
        return this.shareDao.selectShareInfo(shareDto);
    }

    @Override
    public int insertShareInfo(ShareDto shareDto) throws Exception{
        return this.shareDao.insertShareInfo(shareDto);
    }
    
    @Override
    public int updateShareInfo(ShareDto shareDto) throws Exception{
        return this.shareDao.updateShareInfo(shareDto);
    }
    
    @Override
    public void setShareInfo(Model model, HttpSession session){
        UserDto sessionInfo     = (UserDto)session.getAttribute("userInfo");
        ShareDto    shareDto        = new ShareDto();
        ShareDto    shareInfo       = null;
        
        if(sessionInfo != null){
            shareDto.setUserId(sessionInfo.getUserId());
            try {
                shareInfo = this.getShareInfo(shareDto);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        
        model.addAttribute("shareInfo"  , shareInfo);
        model.addAttribute("userInfo"   , sessionInfo);
    }

}
