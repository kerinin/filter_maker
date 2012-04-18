# filter_maker

The idea here is to make it easier to build email filters.  A user provides a set of emails which 
should be included in the new filter, and we try to guess what makes those emails distinct from
the rest of the emails in their account.


## Theory

We start with two sets of emails; the set which should be included in the filter and the set (the training corpus)
of all emails in the user's account (the full set).  The problem is to discover a set of attributes shared between
the emails in the training corpus but infrequent in the full set.

My hypothesis is that this can be accomplished using Shannon entropy.  We construct a set of transformations over
the two sets which produce a set of tokens.  The marginal probability of these tokens can be estimated using the
full set, which allows us to treat the training corpus as a signal for which the tokens have a distinct marginal
probability.  Given these two probability distributions we can calculate the information content of each token.

For example, one transform could generate a set of all words used in an email body.  The distribution of the tokens
(in this case words) for the whole set describes the word frequency over all emails in the user's account, the
distribution of the tokens for the training corpus describes the word frequency over the training corpus.

Once we have the information content of each token, we should be able to construct a filter using the union
of a subset of the tokens with the highest information content.

In simple terms, we're trying to figure out what makes the training corpus distinct from the rest of the emails
in the user's account and then construct a small number of filters which encode these distinct attributes.


## Contributing to filter_maker
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.


## Copyright

Copyright (c) 2012 Ryan Michael. See LICENSE.txt for
further details.

