
/// directed ciclic object (hyper)graph node
class Object {
    /// object name, string value
    String value;

    Object(String V) { value = V; }

    /// @name text dump

    /// stringify object as full tree
    public String toString() { return dump(0, ""); }

    /// full text tree dump
    public String dump(int depth, String prefix) {
        // head
        StringBuilder ret = new StringBuilder();
        ret.append(pad(depth));
        ret.append(head(prefix));
        // subtree
        return ret.toString();
    }

    /// `<T:V>` header
    public String head(String prefix) {
        return prefix + "<" + tag() + ":" + val() + ">";
    }

    /// text tree padding
    String pad(int depth) {
        return "\n"
            + "\t".repeat(depth);
    }

    /// type/class tag
    String tag() { return this.getClass().getSimpleName().toLowerCase(); }

    /// stringified object value
    String val() { return value; }
}
