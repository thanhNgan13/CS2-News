import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.network(
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                  'https://external-preview.redd.it/sky-harry-maguire-manchester-united-captain-proving-his-v0-2iUnImI3m5nL7EeGt0eHpNplh_viJRKs6EXuQVEh73w.jpg?width=640&crop=smart&auto=webp&s=bc5de8c61d6e6da6338912d7955837477b693e7b'),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Harry Maguire',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'As a footballer, I pride myself on my dedication, resilience, and commitment on and off the field. I constantly strive to push my limits and evolve as a player. With every match, I aim to inspire my teammates and fans with my passion and determination. I\'m grateful for the journey so far and excited for the challenges ahead. Together, we\'ll continue to reach new heights.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Reply',
                        style: TextStyle(color: Colors.grey)),
                  ),
                  child_Comment(),
                  child_Comment(),
                  child_Comment(),
                  child_Comment(),
                  child_Comment(),
                  child_Comment(),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class child_Comment extends StatelessWidget {
  const child_Comment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.network(
              height: 20,
              width: 20,
              fit: BoxFit.cover,
              'https://external-preview.redd.it/sky-harry-maguire-manchester-united-captain-proving-his-v0-2iUnImI3m5nL7EeGt0eHpNplh_viJRKs6EXuQVEh73w.jpg?width=640&crop=smart&auto=webp&s=bc5de8c61d6e6da6338912d7955837477b693e7b'),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Harry Maguire',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'As a footballer, I pride myself on my dedication, resilience, and commitment on and off the field. I constantly strive to push my limits and evolve as a player. With every match, I aim to inspire my teammates and fans with my passion and determination. I\'m grateful for the journey so far and excited for the challenges ahead. Together, we\'ll continue to reach new heights.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              TextButton(
                onPressed: () {},
                child:
                    const Text('Reply', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
