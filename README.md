# Bosta-task

This simple app consists of two screens, in a MVVM structure.
I have used Swinjict as a framework to support DI, Reachability to check connectivity, Moya as a network Layer framework, SwiftMessages to show error and success messages, and kingfisher for displaying images.
first screen i attempt to retrieve profile info of the user and his albums and displaying them in a tableview, i achieved it using DiffableDataSource.
Second screen I attempt to get the images of this selected album, in a collectionview also using DiffableDataSource and UICollectionViewLayout.
There's also searching in the current images by title.
Also you can select any image in the album and it'll be shown in a viewer you can zoom in and out, and share it through your social apps.
Also I've made some unit-test for the network layer.


![bosta task](https://user-images.githubusercontent.com/46921426/174447689-3619f54f-8ec2-403e-8b44-c125039babda.gif)
