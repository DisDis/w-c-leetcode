// Input data
// import 'package:collection/collection.dart';

import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:collection/collection.dart';

class ID {
  final int n;
  final List<List<int>> edgeList;
  final List<List<int>> queries;
  final List<bool>? expectResult;

  ID({required this.n, required this.edgeList, required this.queries, this.expectResult});
  @override
  String toString() {
    return "n=$n, edgeList=${edgeList.length > 10 ? '0..${edgeList.length}' : edgeList} queries=${queries.length > 10 ? '0..${queries.length}' : queries}";
  }
}

void main() {
  final n1 = 24578;
  final List<dynamic> edges1 = json.decode(File('./bin/checking-existence-of-edge-length-limited-paths._edge').readAsStringSync());
  final queries1 = json.decode(File('./bin/checking-existence-of-edge-length-limited-paths.query').readAsStringSync());
  final edges2 = edges1.map<List<int>>((e) => (e.map<int>((ee) => ee as int).toList()) as List<int>).toList();
  final queries2 = queries1.map<List<int>>((e) => (e.map<int>((ee) => ee as int).toList()) as List<int>).toList();
  values.add(ID(n: n1, edgeList: edges2, queries: queries2));
  // final v = values.first;
  values.forEach((v) {
    final sb = StringBuffer("'$v'");
    final sw = Stopwatch()..start();
    final result = Solution().distanceLimitedPathsExist(v.n, v.edgeList, v.queries);
    sw.stop();
    final answer = v.expectResult == null
        ? '?'
        : DeepCollectionEquality().equals(result, v.expectResult)
            ? 'Y'
            : 'n';
    sb.write(" -> time:${sw.elapsedMilliseconds}ms '$answer':'${result.length > 10 ? '0..${result.length}' : result}'");
    if (answer == 'n' && v.expectResult != null && v.expectResult!.length == result.length) {
      for (var i = 0; i < v.expectResult!.length; i++) {
        if (v.expectResult![i] != result[i]) {
          sb.writeln();
          sb.writeln('    result[$i] == ${result[i]}, expect: ${v.expectResult![i]}');
          sb.writeln('    q:${v.queries[i]}');
          break;
        }
      }
    }
    print(sb.toString());
  });
}

class GraphEdge<T, TN> {
  final T weight;
  final GraphNode<TN, T> start;
  final GraphNode<TN, T> end;

  GraphEdge({required this.weight, required this.start, required this.end});
  @override
  String toString() {
    return "->${end.id}[$weight]";
  }
}

class GraphNode<T, TE> {
  final int id;
  T metadata;
  final edges = <GraphEdge<TE, T>>[];
  GraphNode(this.id, this.metadata);
  bool operator ==(o) => o is GraphNode && id == o.id;
  @override
  int get hashCode => id;
  @override
  String toString() {
    return "($id: e=${edges.length > 50 ? '0..${edges.length}' : edges})";
  }
}

class Graph<T, TE> {
  final _nodes = <GraphNode<T, TE>>[];
  final int nodeCount;
  Graph(this.nodeCount, T defaultMetadata) {
    for (var i = 0; i < nodeCount; i++) {
      _nodes.add(GraphNode<T, TE>(i, defaultMetadata));
    }
  }
  GraphNode<T, TE> operator [](int key) {
    return _nodes[key];
  }

  void operator []=(int key, GraphNode<T, TE> value) {
    _nodes[key] = value;
  }

  void clearMetadata(T defaultMetadata) {
    for (var node in _nodes) {
      node.metadata = defaultMetadata;
    }
  }

  void sortAllEdges(int compare(TE a, TE b)) {
    for (var node in _nodes) {
      node.edges.sort((a, b) => compare(a.weight, b.weight));
    }
  }
}

class PathEdge<T, TE, TN> {
  final T value;
  final GraphEdge<TE, TN> edge;

  PathEdge(this.value, this.edge);
}

class PathEdgeN1<TE, TN> {
  final int value;
  final GraphEdge<TE, TN> edge;
  final PathEdgeN1<TE, TN>? prev;

  PathEdgeN1(this.value, this.edge, this.prev);
  @override
  String toString() {
    return edge.toString();
  }
}

class UnionFind {
  late List<int> parent;
  late List<int> rank;

  UnionFind(int n) {
    parent = List<int>.generate(n, (i) => i);
    rank = List<int>.filled(n, 0);
  }

  int find(int x) {
    final px = parent[x];
    if (px != x) {
      return parent[x] = find(px);
    } else {
      return px;
    }
  }

  void union(int x, int y) {
    int px = find(x), py = find(y);
    if (px != py) {
      if (rank[px] < rank[py]) {
        parent[px] = py;
      } else if (rank[px] > rank[py]) {
        parent[py] = px;
      } else {
        parent[py] = px;
        rank[px]++;
      }
    }
  }

  bool connected(int x, int y) {
    return find(x) == find(y);
  }
}

/* DSU */
class Solution {
  List<bool> distanceLimitedPathsExist(int n, List<List<int>> edgeList, List<List<int>> queries) {
    edgeList.sort((a, b) => a[2].compareTo(b[2]));
    final len = queries.length;
    final result = List<bool>.filled(len, false);
    for (var i = 0; i < len; i++) {
      queries[i].add(i);
    }
    queries.sort((a, b) => a[2].compareTo(b[2]));
    UnionFind uf = new UnionFind(n);
    int i = 0;
    final edgeLen = edgeList.length;
    for (final query in queries) {
      final limit = query[2];
      while (i < edgeLen && edgeList[i][2] < limit) {
        uf.union(edgeList[i][0], edgeList[i][1]);
        i++;
      }
      final index = query[3];
      result[index] = uf.connected(query[0], query[1]);
    }
    return result;
  }
}

/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
class SolutionPath {
  var minTime = 9999999;
  var maxTime = 0;
  late Graph<int, int> graph;
  List<bool> distanceLimitedPathsExist(int n, List<List<int>> edgeList, List<List<int>> queries) {
    // queries = [queries.first];
    graph = Graph<int, int>(n, 999999);
    for (var edgeData in edgeList) {
      final node1 = graph[edgeData[0]];
      final node2 = graph[edgeData[1]];
      final weight = edgeData[2];
      // undirected
      node1.edges.add(GraphEdge<int, int>(weight: weight, start: node1, end: node2));
      node2.edges.add(GraphEdge<int, int>(weight: weight, start: node2, end: node1));
    }
    graph.sortAllEdges((a, b) => a.compareTo(b));
    final len = queries.length;
    final result = List<bool>.filled(len, false);

    final _queriesByStartNodeId = List<List<int>?>.filled(n, null);

    for (var i = 0; i < len; i++) {
      final query = queries[i];
      var startId = query[0];
      final endId = query[1];
      // change start / end id
      if (startId > endId) {
        query[1] = startId;
        query[0] = endId;
        startId = endId;
      }
      final v = _queriesByStartNodeId[startId];
      if (v == null) {
        _queriesByStartNodeId[startId] = <int>[i];
      } else {
        v.add(i);
      }
    }
    // final totalOptQ = _queriesByStartNodeId.fold<int>(0, (previousValue, element) => element != null ? (previousValue + 1) : previousValue);
    // print('opt q: ${totalOptQ} / ${len} ${totalOptQ * 100 ~/ len}%');

    // final roots = <GraphNode<int, int>>[];
    // for (final node in graph._nodes) {
    //   int nodeEndId = -1;
    //   bool isRoot = true;
    //   for (var edge in node.edges) {
    //     if (nodeEndId == -1) {
    //       nodeEndId = edge.end.id;
    //     } else if (nodeEndId != edge.end.id) {
    //       isRoot = false;
    //       break;
    //     }
    //   }
    //   if (isRoot) {
    //     roots.add(node);
    //   }
    // }
    // print("Roots: ${roots.length}");

    for (var startNodeId = 0; startNodeId < n; startNodeId++) {
      final k = startNodeId;
      if (k % 1000 == 0) {
        print('$k/${graph.nodeCount} (${k * 100 ~/ graph.nodeCount}%), maxTime: ${maxTime}, minTime: $minTime');
      }
      List<int>? indexes = _queriesByStartNodeId[startNodeId];
      if (indexes == null) {
        continue;
      }
      PathEdgeN1<int, int>? rootPath = null;
      for (var index in indexes) {
        final query = queries[index];
        final endNodeId = query[1];
        final limit = query[2];
        if (rootPath != null) {
          final tmpR = _getResult(rootPath, startNodeId, endNodeId, limit);
          if (tmpR != null) {
            result[index] = tmpR;
            continue;
          }
        }

        final sw = Stopwatch()..start();
        rootPath = _getPath(startNodeId, endNodeId);
        sw.stop();
        _updateIterationTime(sw);
        result[index] = rootPath == null ? false : rootPath.value < limit;
        if (rootPath != null) {
          final allNodesInPath = _getNodesPath(rootPath);
          for (final checkNodeId in allNodesInPath) {
            if (checkNodeId > startNodeId) {
              _tryToSearchResult(_queriesByStartNodeId[checkNodeId], result, queries, allNodesInPath, rootPath);
            }
          }
        }
      }
    }
    print("maxTime: ${maxTime}, minTime: $minTime");
    return result;
  }

  void _tryToSearchResult(
      final List<int>? indexes, final List<bool> result, final List<List<int>> queries, final List<int> allNodesInPath, final PathEdgeN1<int, int> rootPath) {
    if (indexes == null) {
      return;
    }
    indexes.removeWhere((index) {
      final query = queries[index];
      final endNodeId = query[1];
      if (!allNodesInPath.contains(endNodeId)) {
        return false;
      }
      final startNodeId = query[0];
      final limit = query[2];
      final tmpR = _getResult(rootPath, startNodeId, endNodeId, limit);
      if (tmpR != null) {
        result[index] = tmpR;
        return true;
      } else {
        return false;
      }
    });
  }

  List<int> _getNodesPath(PathEdgeN1<int, int> path) {
    final listR = <int>[];
    PathEdgeN1<int, int>? result = path;
    listR.add(path.edge.end.id);
    while (result != null) {
      listR.add(path.edge.start.id);
      result = result.prev;
    }
    return listR;
  }

  void _updateIterationTime(Stopwatch sw) {
    if (maxTime < sw.elapsedMilliseconds) {
      maxTime = sw.elapsedMilliseconds;
    }
    if (minTime > sw.elapsedMilliseconds) {
      minTime = sw.elapsedMilliseconds;
    }
  }

  int _getLength(PathEdgeN1<int, int> pathEnd) {
    int count = 0;
    PathEdgeN1<int, int>? result = pathEnd;
    while (result != null) {
      result = result.prev;
      count++;
    }
    return count;
  }

  PathEdgeN1<int, int>? _getIntersect(PathEdgeN1<int, int> pathEnd, final int endNodeId) {
    PathEdgeN1<int, int>? result = pathEnd;
    while (result != null) {
      if (result.edge.end.id == endNodeId) {
        return result;
      }
      result = result.prev;
    }
    return result;
  }

  bool? _getResult(final PathEdgeN1<int, int> pathEnd, final int startNodeId, final int endNodeId, final int limit) {
    PathEdgeN1<int, int>? result = pathEnd;
    int maxW = 0;
    int count = 2;
    while (result != null) {
      final endId = result.edge.end.id;
      final startId = result.edge.start.id;

      if (endId == startNodeId || endId == endNodeId) {
        count--;
      }
      if (startId == startNodeId || startId == endNodeId) {
        count--;
      }
      if (count < 2) {
        if (maxW < result.edge.weight) {
          maxW = result.edge.weight;
        }
      }
      if (count == 0) {
        break;
      }
      result = result.prev;
    }
    if (count == 0) {
      return (maxW < limit);
    }
    return null;
  }

  PathEdgeN1<int, int>? _getPath(final int startNodeId, final int endNodeId) {
    final _closed = List<bool>.filled(graph._nodes.length, false);
    final _open = HeapPriorityQueue<PathEdgeN1<int, int>>((a, b) => a.value.compareTo(b.value));

    graph[startNodeId].edges.forEach((edge) {
      _open.add(PathEdgeN1<int, int>(edge.weight, edge, null));
      //_open.addLast(PathEdgeN1<int, int>(edge.weight, edge, null));
    });
    PathEdgeN1<int, int>? minPath = null;

    while (_open.isNotEmpty) {
      final currentPath = _open.removeFirst();
      final edge = currentPath.edge;
      final endNode = edge.end;
      final edgeEndNodeId = endNode.id;

      if (endNodeId == edgeEndNodeId) {
        if (minPath == null || minPath.value > currentPath.value) {
          minPath = currentPath;
        }
        continue;
      }
      if (_closed[edgeEndNodeId]) {
        continue;
      }
      _closed[edgeEndNodeId] = true;
      if (minPath != null && minPath.value < currentPath.value) {
        continue;
      }

      for (var edgeI in endNode.edges) {
        if (edgeI.end.id != edge.start.id) {
          final maxV = max(currentPath.value, edgeI.weight);
          if (minPath == null || minPath.value >= maxV) {
            _open.add(PathEdgeN1<int, int>(maxV, edgeI, currentPath));
            //_open.addLast(PathEdgeN1<int, int>(maxV, edgeI, currentPath));
          }
        }
      }
    }
    return minPath;
  }
}

/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
class SolutionWFI {
  late Graph<int, int> graph;
  List<bool> distanceLimitedPathsExist(int n, List<List<int>> edgeList, List<List<int>> queries) {
    // queries = [queries.first];
    graph = Graph<int, int>(n, 999999);
    for (var edgeData in edgeList) {
      final node1 = graph[edgeData[0]];
      final node2 = graph[edgeData[1]];
      final weight = edgeData[2];
      // undirected
      node1.edges.add(GraphEdge<int, int>(weight: weight, start: node1, end: node2));
      node2.edges.add(GraphEdge<int, int>(weight: weight, start: node2, end: node1));
    }
    graph.sortAllEdges((a, b) => a.compareTo(b));
    final len = queries.length;
    final result = List<bool>.filled(len, false);

    final _queriesByStartNodeId = List<List<int>?>.filled(n, null);

    for (var i = 0; i < len; i++) {
      final query = queries[i];
      var startId = query[0];
      final endId = query[1];
      // change start / end id
      if (startId > endId) {
        query[1] = startId;
        query[0] = endId;
        startId = endId;
      }
      final v = _queriesByStartNodeId[startId];
      if (v == null) {
        _queriesByStartNodeId[startId] = <int>[i];
      } else {
        v.add(i);
      }
    }
    // final totalOptQ = _queriesByStartNodeId.fold<int>(0, (previousValue, element) => element != null ? (previousValue + 1) : previousValue);
    // print('opt q: ${totalOptQ} / ${len} ${totalOptQ * 100 ~/ len}%');
    List<int> matrixW = _runWFI();
    for (var startNodeId = 0; startNodeId < n; startNodeId++) {
      List<int>? indexes = _queriesByStartNodeId[startNodeId];
      if (indexes == null) {
        continue;
      }
      //    _populateMinDistForList(startNodeId, endNodeIds, maxDist);
      for (var index in indexes) {
        final query = queries[index];
        result[index] = matrixW[query[0] + query[1] * graph.nodeCount] < query[2];
      }
    }

    return result;
  }

  List<int> _runWFI() {
    const int DEFAULT_VALUE = 999999;
    final resultMatrix = List<int>.filled(graph.nodeCount * graph.nodeCount, DEFAULT_VALUE);
    void setRValue(int x, int y, int value) {
      resultMatrix[x + y * graph.nodeCount] = value;
    }

    int getRValue(int x, int y) => resultMatrix[x + y * graph.nodeCount];
    for (var node in graph._nodes) {
      for (var edge in node.edges) {
        final index = edge.start.id + edge.end.id * graph.nodeCount;
        if (resultMatrix[index] > edge.weight) {
          resultMatrix[index] = edge.weight;
        }
      }
      setRValue(node.id, node.id, 0);
    }

    for (var k = 0; k < graph.nodeCount; k++) {
      if (k % 5 == 0) {
        print('$k/${graph.nodeCount} (${k * 100 ~/ graph.nodeCount}%)');
      }
      for (var i = 0; i < graph.nodeCount; i++) {
        final ikValue = getRValue(i, k);
        for (var j = 0; j < graph.nodeCount; j++) {
          if (i == j) {
            continue;
          }
          final kjValue = getRValue(k, j);
          final ijValue = getRValue(i, j);
          // Dist
          /*if (ijValue >   ikValue + kjValue) {
            setRValue(i, j, ikValue + kjValue);
          }*/

          // Max w
          final maxV = max(ikValue, kjValue);
          if (ijValue > maxV) {
            setRValue(i, j, maxV);
          }
        }
      }
    }
    return resultMatrix;
  }
}

/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
class SolutionOld4 {
  late Graph<int, int> graph;
  List<bool> distanceLimitedPathsExist(int n, List<List<int>> edgeList, List<List<int>> queries) {
    // queries = [queries.first];
    graph = Graph<int, int>(n, 999999);
    for (var edgeData in edgeList) {
      final node1 = graph[edgeData[0]];
      final node2 = graph[edgeData[1]];
      final weight = edgeData[2];
      // undirected
      node1.edges.add(GraphEdge<int, int>(weight: weight, start: node1, end: node2));
      node2.edges.add(GraphEdge<int, int>(weight: weight, start: node2, end: node1));
    }
    graph.sortAllEdges((a, b) => a.compareTo(b));
    final len = queries.length;
    final result = List<bool>.filled(len, false);

    final _queriesByStartNodeId = List<List<int>?>.filled(n, null);

    for (var i = 0; i < len; i++) {
      final query = queries[i];
      var startId = query[0];
      final endId = query[1];
      // change start / end id
      if (startId > endId) {
        query[1] = startId;
        query[0] = endId;
        startId = endId;
      }
      final v = _queriesByStartNodeId[startId];
      if (v == null) {
        _queriesByStartNodeId[startId] = <int>[i];
      } else {
        v.add(i);
      }
    }
    final totalOptQ = _queriesByStartNodeId.fold<int>(0, (previousValue, element) => element != null ? (previousValue + 1) : previousValue);
    print('opt q: ${totalOptQ} / ${len} ${totalOptQ * 100 ~/ len}%');
    for (var startNodeId = 0; startNodeId < n; startNodeId++) {
      List<int>? indexes = _queriesByStartNodeId[startNodeId];
      if (indexes == null) {
        continue;
      }
      int maxDist = 0;
      List<int> endNodeIds = indexes
          .map((e) {
            final dist = queries[e][2];
            if (maxDist < dist) {
              maxDist = dist;
            }
            return queries[e][1];
          })
          .toSet()
          .toList(growable: true);
      _populateMinDistForList(startNodeId, endNodeIds, maxDist);
      for (var index in indexes) {
        final query = queries[index];
        result[index] = (graph[query[1]].metadata < query[2]);
      }
    }

    return result;
  }

  _populateMinDistForList(final int startNodeId, final List<int> endNodeIds, int maxDist) {
    final _closed = List<bool>.filled(graph._nodes.length, false);
    final _open = HeapPriorityQueue<PathEdge<int, int, int>>((a, b) => a.value.compareTo(b.value)); //Queue<PathEdge<int, int, int>>();
    graph.clearMetadata(9999999);
    graph[startNodeId].metadata = 0;

    graph[startNodeId].edges.forEach((edge) {
      if (edge.weight < maxDist) {
        _open.add(PathEdge<int, int, int>(edge.weight, edge));
      }
    });
    while (_open.isNotEmpty) {
      final currentPath = _open.removeFirst();
      final edge = currentPath.edge;
      final endNode = edge.end;
      final edgeEndNodeId = endNode.id;

      if (_closed[edgeEndNodeId]) {
        continue;
      }
      if (endNode.metadata > currentPath.value) {
        endNode.metadata = currentPath.value;
      }
      _closed[edgeEndNodeId] = true;

      if (endNodeIds.remove(edgeEndNodeId)) {
        if (endNodeIds.isEmpty) {
          return;
        }
      }

      for (var edge in edge.end.edges) {
        if (edge.end.id != edge.start.id && edge.weight < maxDist) {
          _open.add(PathEdge<int, int, int>(max(currentPath.value, edge.weight), edge));
        }
      }
    }
  }
}

/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
class SolutionOld2 {
  late Graph<int, int> graph;
  List<bool> distanceLimitedPathsExist(int n, List<List<int>> edgeList, List<List<int>> queries) {
    // queries = [queries.first];
    graph = Graph<int, int>(n, 999999);
    for (var edgeData in edgeList) {
      final node1 = graph[edgeData[0]];
      final node2 = graph[edgeData[1]];
      final weight = edgeData[2];
      // undirected
      node1.edges.add(GraphEdge<int, int>(weight: weight, start: node1, end: node2));
      node2.edges.add(GraphEdge<int, int>(weight: weight, start: node2, end: node1));
    }
    graph.sortAllEdges((a, b) => a.compareTo(b));
    final len = queries.length;
    final result = List<bool>.filled(len, false);

    final _queriesByStartNodeId = List<List<int>?>.filled(n, null);

    for (var i = 0; i < len; i++) {
      final query = queries[i];
      var startId = query[0];
      final endId = query[1];
      // change start / end id
      if (startId > endId) {
        query[1] = startId;
        query[0] = endId;
        startId = endId;
      }
      final v = _queriesByStartNodeId[startId];
      if (v == null) {
        _queriesByStartNodeId[startId] = <int>[i];
      } else {
        v.add(i);
      }
    }

    for (var startNodeId = 0; startNodeId < n; startNodeId++) {
      List<int>? indexes = _queriesByStartNodeId[startNodeId];
      if (indexes == null) {
        continue;
      }
      _populateMinDist(startNodeId);
      for (var index in indexes) {
        final query = queries[index];
        result[index] = (graph[query[1]].metadata < query[2]);
      }
    }
    return result;
  }

/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
  void _populateMinDist(final int startNodeId) {
    final _closed = Set<int>();
    //HeapPriorityQueue?
    final _open = Queue<GraphEdge<int, int>>();
    graph.clearMetadata(999999);
    graph[startNodeId].metadata = 0;
    _open.addAll(graph[startNodeId].edges);
    while (_open.isNotEmpty) {
      final currentPath = _open.removeFirst();
      final endNode = currentPath.end;
      final edgeEndNodeId = endNode.id;
      if (endNode.metadata > currentPath.weight) {
        endNode.metadata = currentPath.weight;
      }
      if (_closed.contains(edgeEndNodeId)) {
        continue;
      }
      _closed.add(edgeEndNodeId);
      _open.addAll(currentPath.end.edges);
    }
  }
}

/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
/** ------------------ OOOOOOOOOOOOLLLLLLLLLLLLLLLDDDDDDDDD --------------------- */
class SolutionOld3 {
  late Graph<int, int> graph;
  List<bool> distanceLimitedPathsExist(int n, List<List<int>> edgeList, List<List<int>> queries) {
    // queries = [queries.first];
    graph = Graph<int, int>(n, 999999);
    for (var edgeData in edgeList) {
      final node1 = graph[edgeData[0]];
      final node2 = graph[edgeData[1]];
      final weight = edgeData[2];
      // undirected
      node1.edges.add(GraphEdge<int, int>(weight: weight, start: node1, end: node2));
      node2.edges.add(GraphEdge<int, int>(weight: weight, start: node2, end: node1));
    }
    graph.sortAllEdges((a, b) => a.compareTo(b));
    final len = queries.length;
    final result = List<bool>.filled(len, false);

    final _queriesByStartNodeId = List<List<int>?>.filled(n, null);

    for (var i = 0; i < len; i++) {
      final query = queries[i];
      var startId = query[0];
      final endId = query[1];
      // change start / end id
      if (startId > endId) {
        query[1] = startId;
        query[0] = endId;
        startId = endId;
      }
      final v = _queriesByStartNodeId[startId];
      if (v == null) {
        _queriesByStartNodeId[startId] = <int>[i];
      } else {
        v.add(i);
      }
    }

    var minTime = 9999999;
    var maxTime = 0;
    for (var startNodeId = 0; startNodeId < n; startNodeId++) {
      List<int>? indexes = _queriesByStartNodeId[startNodeId];
      if (indexes == null) {
        continue;
      }
      //    _populateMinDistForList(startNodeId, endNodeIds, maxDist);
      for (var index in indexes) {
        final query = queries[index];
        final sw = Stopwatch()..start();
        result[index] = _getResult(startNodeId, query[1], query[2]);
        sw.stop();
        if (maxTime < sw.elapsedMilliseconds) {
          maxTime = sw.elapsedMilliseconds;
        }
        if (minTime > sw.elapsedMilliseconds) {
          minTime = sw.elapsedMilliseconds;
        }
      }
    }
    print("maxTime: ${maxTime}, minTime: $minTime");
    return result;
  }

  bool _getResult(final int startNodeId, final int endNodeId, final int limit) {
    if (startNodeId == endNodeId) {
      return true;
    }
    final _closed = List<bool>.filled(graph._nodes.length, false);
    //HeapPriorityQueue?
    final _open = Queue<GraphEdge<int, int>>();
    filterEdge(edge) {
      if (edge.weight < limit) _open.add(edge);
    }

    graph[startNodeId].edges.forEach(filterEdge);
    while (_open.isNotEmpty) {
      final currentEdge = _open.removeFirst();
      final edgeEndNodeId = currentEdge.end.id;
      if (_closed[edgeEndNodeId]) {
        continue;
      }
      if (edgeEndNodeId == endNodeId) {
        return true;
      }
      _closed[edgeEndNodeId] = true;
      currentEdge.end.edges.forEach(filterEdge);
    }
    return false;
  }
}

// INPUT DATA
final values = <ID>[
  ID(n: 3, edgeList: [
    [0, 1, 2],
    [1, 2, 4],
    [2, 0, 8],
    [1, 0, 16]
  ], queries: [
    [0, 2, 4],
    [0, 2, 5],
    [0, 2, 1],
  ], expectResult: [
    false,
    true,
    false,
  ]),
  ID(n: 34, edgeList: [
    [17, 26, 57],
    [4, 15, 100],
    [31, 18, 23],
    [6, 18, 32],
    [12, 26, 19],
    [8, 9, 14],
    [18, 33, 99],
    [4, 30, 60],
    [27, 5, 52],
    [5, 12, 31],
    [30, 16, 63],
    [31, 25, 15],
    [32, 5, 89],
    [27, 13, 31],
    [11, 5, 30],
    [18, 30, 5],
    [10, 31, 21],
    [30, 16, 100],
    [1, 5, 15],
    [24, 11, 61],
    [2, 10, 97],
    [20, 32, 12],
    [24, 17, 1],
    [33, 5, 27],
    [11, 6, 71],
    [16, 31, 93],
    [16, 32, 59],
    [12, 31, 28],
    [22, 13, 79],
    [19, 24, 39],
    [28, 17, 36],
    [3, 9, 82],
    [19, 10, 88],
    [9, 23, 89],
    [17, 2, 70],
    [25, 2, 66],
    [30, 8, 74],
    [26, 0, 77],
    [25, 23, 86],
    [7, 4, 48],
    [22, 11, 21],
    [20, 24, 46],
    [30, 20, 41],
    [16, 20, 48],
    [28, 0, 77]
  ], queries: [
    [14, 25, 32],
    [16, 7, 80],
    [16, 2, 2],
    [2, 24, 3],
    [17, 4, 30],
    [30, 6, 56],
    [0, 4, 89],
    [5, 15, 89],
    [10, 18, 40],
    [8, 1, 37],
    [19, 2, 13],
    [1, 28, 66],
    [7, 16, 24],
    [13, 33, 67],
    [32, 31, 26],
    [12, 29, 88],
    [8, 24, 72],
    [30, 16, 87],
    [6, 26, 14],
    [28, 25, 100],
    [12, 13, 54],
    [11, 21, 59],
    [26, 8, 60],
    [26, 19, 27],
    [20, 26, 80],
    [30, 11, 21],
    [15, 7, 49],
    [26, 28, 81],
    [4, 32, 22],
    [21, 26, 32],
    [22, 25, 46],
    [9, 6, 13],
    [21, 26, 9],
    [14, 29, 33],
    [5, 3, 13],
    [23, 27, 84],
    [7, 6, 27],
    [28, 25, 50],
    [2, 10, 78],
    [33, 14, 62],
    [12, 19, 76],
    [29, 26, 26],
    [6, 8, 9],
    [7, 18, 56],
    [26, 17, 91]
  ], expectResult: [
    false,
    true,
    false,
    false,
    false,
    true,
    true,
    false,
    true,
    false,
    false,
    true,
    false,
    true,
    false,
    false,
    false,
    true,
    false,
    true,
    true,
    false,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    true,
    false,
    true,
    false,
    false,
    false,
    true
  ]),
  ID(n: 30, edgeList: [
    [9, 14, 88],
    [11, 27, 51],
    [29, 22, 58],
    [29, 27, 26],
    [18, 20, 97],
    [25, 4, 12],
    [2, 4, 16],
    [17, 18, 40],
    [21, 9, 37],
    [3, 14, 6],
    [8, 23, 24],
    [7, 27, 39],
    [24, 16, 95],
    [9, 29, 19],
    [9, 18, 22],
    [26, 21, 12],
    [12, 14, 81],
    [6, 14, 79],
    [3, 16, 47],
    [13, 19, 18],
    [24, 15, 59],
    [14, 20, 26],
    [24, 20, 14],
    [25, 26, 7],
    [13, 12, 81],
    [1, 0, 51],
    [17, 4, 39],
    [8, 16, 77],
    [28, 9, 53],
    [23, 6, 40],
    [29, 18, 31],
    [10, 9, 35],
    [29, 27, 7],
    [1, 29, 91],
    [10, 19, 70],
    [28, 29, 58],
    [20, 17, 86],
    [21, 14, 77],
    [19, 4, 43],
    [26, 21, 22],
    [2, 26, 61],
    [24, 22, 16]
  ], queries: [
    /*my*/ [21, 27, 17],
    [21, 10, 1],
    [14, 2, 21],
    [15, 11, 64],
    [21, 27, 17],
    [3, 26, 1],
    [26, 18, 93],
    [8, 6, 5],
    [18, 19, 62],
    [19, 18, 30],
    [7, 25, 76],
    [0, 20, 78],
    [11, 6, 16],
    [16, 2, 91],
    [22, 21, 66],
    [28, 24, 95],
    [19, 4, 18],
    [14, 23, 37],
    [19, 27, 7],
    [15, 10, 83],
    [23, 5, 59],
    [17, 12, 9],
    [26, 5, 90],
    [26, 24, 46],
    [21, 29, 30],
    [24, 18, 54],
    [27, 3, 94],
    [1, 23, 75],
    [28, 22, 75],
    [27, 11, 32],
    [11, 20, 62],
    [12, 11, 10],
    [17, 14, 4],
    [27, 22, 67],
    [19, 0, 25],
    [16, 24, 38],
    [23, 6, 35],
    [11, 21, 96],
    [28, 14, 38],
    [29, 17, 8],
    [10, 21, 85],
    [2, 27, 97],
    [25, 13, 98]
  ], expectResult: [
    /**/ false,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    false,
    true,
    true,
    true,
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    false,
    true,
    false,
    false,
    false,
    true,
    false,
    false,
    true,
    true,
    true
  ]),
  ID(n: 13, edgeList: [
    [9, 1, 53],
    [3, 2, 66],
    [12, 5, 99],
    [9, 7, 26],
    [1, 4, 78],
    [11, 1, 62],
    [3, 10, 50],
    [12, 1, 71],
    [12, 6, 63],
    [1, 10, 63],
    [9, 10, 88],
    [9, 11, 59],
    [1, 4, 37],
    [4, 2, 63],
    [0, 2, 26],
    [6, 12, 98],
    [9, 11, 99],
    [4, 5, 40],
    [2, 8, 25],
    [4, 2, 35],
    [8, 10, 9],
    [11, 9, 25],
    [10, 11, 11],
    [7, 6, 89],
    [2, 4, 99],
    [10, 4, 63]
  ], queries: [
    [9, 7, 65],
    [9, 6, 1],
    [4, 5, 34],
    [10, 8, 43],
    [3, 7, 76],
    [4, 2, 15],
    [7, 6, 52],
    [2, 0, 50],
    [7, 6, 62],
    [1, 0, 81],
    [4, 5, 35],
    [0, 11, 86],
    [12, 5, 50],
    [11, 2, 2],
    [9, 5, 6],
    [12, 0, 95],
    [10, 6, 9],
    [9, 4, 73],
    [6, 10, 48],
    [12, 0, 91],
    [9, 10, 58],
    [9, 8, 73],
    [2, 3, 44],
    [7, 11, 83],
    [5, 3, 14],
    [6, 2, 33]
  ], expectResult: [
    true,
    false,
    false,
    true,
    true,
    false,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    false,
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    true,
    false,
    true,
    false,
    false
  ]),
  ID(n: 3, edgeList: [
    [0, 1, 2],
    [1, 2, 4],
    [2, 0, 8],
    [1, 0, 16]
  ], queries: [
    [0, 1, 2],
    [0, 2, 5],
    [0, 2, 5],
    [0, 2, 1],
  ], expectResult: [
    false,
    true,
    true,
    false
  ]),
  ID(n: 3, edgeList: [
    [0, 1, 8],
    [0, 1, 2],
    [1, 2, 4],
    [2, 0, 8],
    [1, 0, 16]
  ], queries: [
    [0, 1, 2],
    [0, 2, 5],
  ], expectResult: [
    false,
    true
  ]),
  ID(n: 5, edgeList: [
    [0, 1, 10],
    [1, 2, 5],
    [2, 3, 9],
    [3, 4, 13]
  ], queries: [
    [0, 4, 14],
    [1, 4, 13]
  ], expectResult: [
    true,
    false
  ]),
];
