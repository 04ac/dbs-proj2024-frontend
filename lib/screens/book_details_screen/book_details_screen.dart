import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

import '../../models/book.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;
  const BookDetailsScreen({super.key, required this.book});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.favorite,
        ),
        onPressed: () {},
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.book.title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.network(widget.book.imageUrl!),
              const SizedBox(
                height: 10,
              ),
              Text(
                "By ${widget.book.authors!.join(", ")}",
                softWrap: true,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.book.categories!,
                textAlign: TextAlign.center,
                style: const TextStyle(letterSpacing: 1, fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      RatingStars(
                        editable: false,
                        rating: widget.book.rating!,
                        color: Colors.amber,
                        iconSize: 24,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.book.rating!} stars\n"
                        "${widget.book.ratingCount!} ratings",
                        textAlign: TextAlign.center,
                        style: const TextStyle(letterSpacing: 1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Text(
                    "Published: ${widget.book.datePublished!}\nFor ages: ${widget.book.forAges!}\nand above",
                    textAlign: TextAlign.center,
                    style: const TextStyle(letterSpacing: 1),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ExpandableText(
                widget.book.description!.split(". ").join(". \n\n"),
                expandText: "Show more",
                collapseText: "Show less",
                maxLines: 12,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  letterSpacing: 0.7,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
