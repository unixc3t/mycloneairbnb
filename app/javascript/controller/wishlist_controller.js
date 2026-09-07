import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  updateWishlistStatus() {
    const isUserLoggedIn = this.element.dataset.userLoggedIn;

    if(isUserLoggedIn === "false"){
      document.querySelector(".js-login").click()
      return;
    }

    

    if (this.element.dataset.status === "false") {
      const propertyId = this.element.dataset.propertyId;
      const userId = this.element.dataset.userId;
      console.log(propertyId);
      console.log(userId);

      this.addPropertyToWishlist(propertyId, userId);

    } else {
      const wishlistId = this.element.dataset.wishlistId;
      this.removePropertyFromWishlist(wishlistId)
    }
  }

  addPropertyToWishlist(propertyId, userId){
    const params = {
      property_id: propertyId,
      user_id: userId
    };
    const options = {
      method: 'POST',
      headers:{
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(params),
    };

    fetch('/api/wishlists', options).then(response=>{
      if(!response.ok){
        throw Error(response.status)
      }
      return response.json()
    }).then(data=> {
      console.log(data);
  
      this.element.classList.remove("fill-none");
      this.element.classList.add("fill-red-500");
      this.element.dataset.status = "true";

    } ).catch(e => {{
      console.log(e)
    }})

  }

  removePropertyFromWishlist(wishlistId){
    fetch("/api/wishlists/"+ wishlistId,{
      method: 'DELETE'
    }).then(response=>{
      if(!response.ok){
        throw Error(response.status)
      }
      return response.json()
    }).then(data=> {
      console.log(data);
      this.element.dataset.wishlistId="";
      this.element.classList.remove("fill-red-500");
      this.element.classList.add("fill-none");
      this.element.dataset.status = "false";

    } ).catch(e => {{
      console.log(e)
    }})
  }
}
