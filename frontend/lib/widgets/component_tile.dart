// all-coder
//necessary imports
import 'package:flutter/material.dart';
import 'package:frontend/providers/providers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

//relative imports
import '../models/component.dart';
import '../screens/component_view.dart';

class ComponentTile extends ConsumerStatefulWidget {
  const ComponentTile({required this.component, super.key});
  final Component component;
  @override
  ConsumerState<ComponentTile> createState() {
    return _ComponentTileState();
  }
}

class _ComponentTileState extends ConsumerState<ComponentTile> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartNotifier);
    final currentCount = cart[widget.component] ?? 0;

    return Container(
      decoration: const BoxDecoration(color: Color(0xff2F2E2E)),
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      width: (MediaQuery.of(context).size.width / 2 - 20).toDouble(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return ComponentView(component: widget.component);
              }));
            },
            child: Container(
              color: Colors.white,
              height: 120,
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: widget.component.imageURL.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: widget.component.imageURL,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.broken_image),
                    )
                  : Icon(Icons.image),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 5, 1),
            child: Text(
              widget.component.name,
              style: GoogleFonts.firaMono(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 5, 3),
            child: Text(
              "In Stock : ${widget.component.available}",
              style: GoogleFonts.firaMono(
                fontSize: 15,
                color: const Color(0xffA1A1A1),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xff484848)),
            height: 30,
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Positioned(
                  top: 1,
                  left: 4,
                  child: GestureDetector(
                    onTap: () {
                      if (currentCount > 0) {
                        // Allow it to decrement to zero
                        ref
                            .read(cartNotifier.notifier)
                            .decrement(widget.component);
                      }
                    },
                    child: const Icon(
                      Ionicons.remove_circle_outline,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                Positioned(
                  top: 1,
                  left: (MediaQuery.of(context).size.width / 2 - 72).toDouble(),
                  child: GestureDetector(
                    onTap: () {
                      if (currentCount < widget.component.available) {
                        ref
                            .read(cartNotifier.notifier)
                            .increment(widget.component, 1);
                      }
                    },
                    child: const Icon(
                      Ionicons.add_circle_outline,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                Positioned(
                  top: 3,
                  left: ((MediaQuery.of(context).size.width / 2 - 50) / 2)
                      .toDouble(),
                  child: Text(
                    "$currentCount",
                    style: GoogleFonts.firaMono(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
