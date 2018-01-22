package linkednest.openapi;


public class FlickrAPITest {
    /*
    @Test
    public void testFlickr() throws Exception{
        Flickr f = new Flickr("df1e5e194de94bb405b2ce898db83b90", "ed6088a596f20afd", new REST());
        Auth auth = new Auth();
        User user = new User();
        user.setId("jwlee208");
        auth.setUser(user);
        f.setAuth(auth);
        
        GroupsInterface     groups       = f.getGroupsInterface();

        // search group
        Collection<Group> searchedGroups = groups.search("jwlee208", 10, 10);
        
        if(!searchedGroups.isEmpty()){
            System.out.println("SearchGroups > ");
            for(Group group : searchedGroups){
                System.out.println(group.getName());
            }
        }
        
        System.out.println(groups.search("[jQuery] window.onload와 ready()", 1, 1));
        
        
        
        PhotosInterface     photos       = f.getPhotosInterface();
        SearchParameters params = new SearchParameters();
        params.setUserId("jwlee208");
        params.setSafeSearch(Flickr.SAFETYLEVEL_SAFE);
//        params.setText("jquery");
        
        
        PhotoList<Photo> photoList = photos.search(params, 100, 1); 
        Collection<Photocount> photoCount = photos.getCounts(null, null);
        System.out.println(photoCount.size());
//                photos.getContactsPhotos(10, true, true, true);
        
        if(!photoList.isEmpty()){
            for(Photo photo : photoList){
                System.out.println("photo.getTitle() : " + photo.getTitle() +"\nphoto.getLargeUrl() : " + photo.getLargeUrl() + "\nphoto.getLicense() : " + photo.getLicense() +"\nphoto.getUrls() : " + photo.getUrls() +"\nphoto.getTags() : " + photo.getTags() +"\n photo.getPhotoUrl() : " + photo.getPhotoUrl() +"\nphoto.getPermissions() : " + photo.getPermissions() +"\nphoto.getThumbnailUrl() : " + photo.getThumbnailUrl());
                System.out.println("\n----------------------------------");
            }
        }
        
        
        
        
        TestInterface testInterface = f.getTestInterface();
        Collection results = testInterface.echo(Collections.EMPTY_MAP);
        
        System.out.println(results);
        List<Gallery> list = new ArrayList<Gallery>();
        
        System.out.println(list.size());
        if(list.size() > 0){
            for(Gallery gallery : list){
                System.out.println(gallery.getTitle());        
            }
        }       
    }
    */
}
