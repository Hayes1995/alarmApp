import 'package:alarm_clock/widgets/category_grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your playlist'),
      ),
      backgroundColor: Colors.black,
      body: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}

//     return CupertinoPageScaffold(
//       child: Container(child: 
      
//       CupertinoNavigationBar(
//         middle: Text('Select your playlist'),
//       ),
//       color: Colors.black,

//       ),
//     );
//   }
// }
