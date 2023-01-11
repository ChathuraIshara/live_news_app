import '../model/categorymodel.dart';

List<CategoryModel> getCategories()
{
  List<CategoryModel> category=<CategoryModel>[];

  CategoryModel categories;

  categories=new CategoryModel();
  categories.imgurl= "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  categories.categoriname="Business";
  category.add(categories);

   categories=new CategoryModel();
   categories.imgurl="https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
   categories.categoriname="Entertainment";
   category.add(categories);

   categories = new CategoryModel();
  categories.categoriname = "General";
  categories.imgurl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(categories);

  //4
  categories = new CategoryModel();
  categories.categoriname = "Health";
  categories.imgurl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(categories);

  //5
  categories = new CategoryModel();
  categories.categoriname = "Science";
  categories.imgurl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(categories);

  //5
  categories = new CategoryModel();
  categories.categoriname = "Sports";
  categories.imgurl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(categories);

  //5
  categories = new CategoryModel();
  categories.categoriname = "Technology";
  categories.imgurl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categories);


  return category;




  
}