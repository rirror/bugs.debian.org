use utf8;
package Debbugs::DB::Result::BugMessage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Debbugs::DB::Result::BugMessage

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<bug_message>

=cut

__PACKAGE__->table("bug_message");

=head1 ACCESSORS

=head2 bug

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

Bug id (matches bug)

=head2 message

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

Message id (matches message)

=head2 message_number

  data_type: 'integer'
  is_nullable: 0

Message number in the bug log

=head2 bug_log_offset

  data_type: 'integer'
  is_nullable: 1

Byte offset in the bug log

=head2 offset_valid

  data_type: 'timestamp with time zone'
  is_nullable: 1

Time offset was valid

=cut

__PACKAGE__->add_columns(
  "bug",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "message",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "message_number",
  { data_type => "integer", is_nullable => 0 },
  "bug_log_offset",
  { data_type => "integer", is_nullable => 1 },
  "offset_valid",
  { data_type => "timestamp with time zone", is_nullable => 1 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<bug_message_bug_message_idx>

=over 4

=item * L</bug>

=item * L</message>

=back

=cut

__PACKAGE__->add_unique_constraint("bug_message_bug_message_idx", ["bug", "message"]);

=head1 RELATIONS

=head2 bug

Type: belongs_to

Related object: L<Debbugs::DB::Result::Bug>

=cut

__PACKAGE__->belongs_to(
  "bug",
  "Debbugs::DB::Result::Bug",
  { id => "bug" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 message

Type: belongs_to

Related object: L<Debbugs::DB::Result::Message>

=cut

__PACKAGE__->belongs_to(
  "message",
  "Debbugs::DB::Result::Message",
  { id => "message" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-04 10:59:03
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BRbN9C6P/wvWWmSmjNGjLA

sub sqlt_deploy_hook {
    my ($self, $sqlt_table) = @_;
    $sqlt_table->add_index(name => 'bug_message_idx_bug_message_number',
			   fields => [qw(bug message_number)],
			  );
}
1;
